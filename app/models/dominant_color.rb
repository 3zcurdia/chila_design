# frozen_string_literal: true

require "shellwords"

class DominantColor
  attr_accessor :src_image_path

  def initialize(src_image_path, image_type = nil)
    @src_image_path = src_image_path
    @image_type = image_type
  end

  def to_hex
    sorted_pixels.collect { |pixel| ChunkyPNG::Color.to_hex(pixel, false) }
  end

  def to_rgb
    sorted_pixels.collect { |pixel| ChunkyPNG::Color.to_truecolor_bytes(pixel) }
  end

  def to_rgba
    sorted_pixels.collect { |pixel| ChunkyPNG::Color.to_truecolor_alpha_bytes(pixel) }
  end

  def by_percentage
    sorted_pixels
    pixel_count = @pixels.size
    sorted_pixels.collect { |pixel| @grouped_pixels[pixel].size / pixel_count.to_f }
  end

  def sorted_pixels
    @sorted_pixels ||= extract_colors_from_image
  end

  private

  def parse_result(hstring)
    hstring.scan(/(\d*):.*(#[0-9A-Fa-f]*)/).collect do |match|
      [match[0].to_i, Color::RGB.from_html(match[1])]
    end
  end

  def extract_colors_from_image
    downsample_colors_and_convert_to_png!
    colors = sort_by_dominant_color
    cleanup_temporary_files!
    colors
  end

  def downsample_colors_and_convert_to_png!
    @source_image = open_source_image
    @downsampled_image = open_downsampled_image

    Terrapin::CommandLine.new("convert", image_magick_params)
                         .run(in: Shellwords.escape(File.expand_path(@source_image.path)),
                              resolution: "150x150",
                              colors: "8",
                              quantize: "RGB",
                              out: File.expand_path(@downsampled_image.path))
  end

  def open_source_image
    return File.open(@src_image_path) unless source_image_url?

    original_extension = @image_type || URI.parse(@src_image_path).path.split(".").last

    tempfile = Tempfile.open(["source", ".#{original_extension}"])
    remote_file_data = open(@src_image_path).read

    tempfile.write(remote_file_data.force_encoding("UTF-8"))
    tempfile.close
    tempfile
  end

  def open_downsampled_image
    tempfile = Tempfile.open(["downsampled", ".png"])
    tempfile.binmode
    tempfile
  end

  def image_magick_params
    "':in[0]' -resize :resolution -colors :colors -colorspace :quantize -quantize :quantize :out"
  end

  def sort_by_dominant_color
    grouped_pixels.sort_by { |_k, v| v.size }.reverse.flatten.uniq
  end

  def grouped_pixels
    @grouped_pixels ||= pixels.group_by { |pixel| pixel }
  end

  def pixels
    @pixels ||= ChunkyPNG::Image.from_file(File.expand_path(@downsampled_image.path)).pixels
  end

  def cleanup_temporary_files!
    @source_image.close! if source_image_url?
    @downsampled_image&.close!
  end

  def source_image_url?
    @src_image_path =~ %r{^https?://}
  end
end
