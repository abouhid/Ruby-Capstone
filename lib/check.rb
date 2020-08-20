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
    check_empty_lines(file_data, file_path)

    file_data.each_with_index do |line, i|
      next_l = i + 1
      space_before(next_l, line, ';')
      space_before(next_l, line, '{')
      space_after(next_l, line, ':')
      space_after(next_l, line, ',')
    end
  end
end
