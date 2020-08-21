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
    file_scanned.each_with_index do |_line, i|
      check_empty_lines(file_data, i)
      check_indentation(@file_scanned, @file_data[i], i)
      space_before(';', @file_scanned[i], i)
      space_before('{', @file_scanned[i], i)
      space_after(':', @file_scanned[i], i)
      space_after(',', @file_scanned[i], i)
    end
  end
end
