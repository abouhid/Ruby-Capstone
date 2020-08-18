require_relative '../lib/errors.rb'
include Errors
class Check
    attr_accessor :input, :offenses
  def initialize(input)
    @offenses = []
  end

  def check 
    output_max_line_length
  end

  def output_max_line_length
    max_line_length
    max_line_lengt

  end
end
