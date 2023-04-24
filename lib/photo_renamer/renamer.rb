# frozen_string_literal: true

module PhotoRenamer
  VALID_EXTENSIONS = %w[jpg jpeg png].freeze

  class Renamer
    def initialize(source)
      @source = source
      @photo_rows = build_photo_rows
    end
      
    def rename
      renames_map = generate_renames_map
      @photo_rows.map { |row| renames_map[row.join] }.compact.join("\n")
    end
    
    private

    def generate_renames_map
      group_by_location.each_with_object({}) do |(key, location_rows), acc|
        size = location_rows.size

        sort_by_date(location_rows).each.with_index(1) do |row, index|
          acc[row.join] = padded_name(row, index, size)
        end
      end
    end

    def build_photo_rows
      return [] if @source.nil? || !@source.is_a?(String) || @source.empty?

      @source.split("\n").map { |elem| elem.strip.split(',') }.reject do |row|
        file_format = row.first.split('.').last
        !VALID_EXTENSIONS.include?(file_format)
      end
    end
      
    def sort_by_date(rows)
      rows.sort do |row1, row2|
        date1 = DateTime.strptime(row1.last.strip, '%Y-%m-%d %H:%M:%S')
        date2 = DateTime.strptime(row2.last.strip, '%Y-%m-%d %H:%M:%S')
        date1 <=> date2
      end
    end
        
    def group_by_location
      @photo_rows.group_by{ |row| row[1].strip }
    end

    def padded_name(row, index, size)
      file_format = row.first.split('.').last

      location = row[1].strip
      padding_size = size.to_s.size - index.to_s.size
      padding = "0" * padding_size

      "#{location}#{padding}#{index}.#{file_format}"
    end
  end

  def self.rename(source)
    Renamer.new(source).rename
  end
end