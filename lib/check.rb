require_relative '../lib/errors.rb'
require 'strscan'

class Check
  include Errors
  attr_accessor :file_data, :offenses, :file, :file_path, :file_scanned

  def initialize(file_scanned, file_path, file_data)
    @offenses = []
    @file_path = file_path
    @file_data = file_data
    @file_scanned = file_scanned
    check
  end

  def check
    # a = check_indentation(file_scanned, file_data[1], 1)
    file_scanned.each_with_index do |line, i|
      check_empty_lines(file_data, i)
      check_indentation(@file_scanned, @file_data[i], i)
      space_before(i + 1, line, ';')
      space_before(i + 1, line, '{')
      space_after(i + 1, line, ':')
      space_after(i + 1, line, ',')
    end
  end
end
