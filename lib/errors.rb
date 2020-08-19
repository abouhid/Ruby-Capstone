require_relative "../lib/check.rb"
require_relative "../lib/read.rb"
require "strscan"

module Errors
  def check_indentation(file_data)
    counter = 0
  end

  def check_spacing(file_data)
    # offenses << false
  end

  def check_closing(file_data)
    # offenses << 3
  end

  def check_empty_lines(file_data)
    file_data.size.times do |i|
      pl = i - 1
      cl = i
      nl = i + 1
      if file_data[i] == "" && file_data[pl] == ""
       puts "Line: #{i}:".blue + ' Warning: '.yellow + 'Layout/EmptyLines: Extra blank line detected.'
       offenses << 1
      end
      # lib/errors.rb:28:1: C:

    end
  end
end
