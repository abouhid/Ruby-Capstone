require_relative '../lib/errors.rb'
require 'strscan'

class Check
  include Errors
  attr_accessor :file_data, :offenses, :file, :file_path

  def initialize(file_data, file_path)
    @offenses = []
    @file_path = file_path
    check(file_data)
  end

  def check(file_data)
    # check_empty_lines
    # check_closing(file_data)
    check_indentation(file_data)

    file_data.each_with_index do |line, i|
      ind = i + 1
      # space_before(ind, line, ';')
      # space_before(ind, line, '{')
      # space_after(ind, line, ':')
      # space_after(ind, line, ',')
    end
  end
end
