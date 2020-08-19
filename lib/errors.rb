require_relative '../lib/check.rb'
require_relative '../lib/read.rb'
require 'strscan'

module Errors
  def check_indentation(file_data)
    counter = 0;
    read_file = Read.new(file_data)
    s = StringScanner.new(read_file.hash.to_s)

  end

  def check_spacing(file_data)
    offenses << false
  end

  def check_closing(file_data)
    offenses << 3
  end

  def check_empty_lines(file_data)
    offenses << 4
  end
end
