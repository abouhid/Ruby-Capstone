require_relative '../lib/errors.rb'
class Check
  include Errors
  attr_accessor :input, :offenses
  def initialize(_input)
    @offenses = []
    check
  end

  def check
    check_indentation
    check_spacing
    check_closing
    check_empty_lines
  end
end
