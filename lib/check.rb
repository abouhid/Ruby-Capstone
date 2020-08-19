require_relative '../lib/errors.rb'
class Check
  include Errors
  attr_accessor :file_data, :offenses
  def initialize(file_data)
    @offenses = []
    @file_data = file_data
    check
  end

  def check
    check_indentation(file_data)
    check_spacing(file_data)
    check_closing(file_data)
    check_empty_lines(file_data)
  end
end
