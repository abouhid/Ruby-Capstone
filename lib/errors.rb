require_relative '../lib/check.rb'
module Errors
  def check_indentation
    offenses << 1
  end

  def check_spacing
    offenses << false
  end

  def check_closing
    offenses << 3
  end

  def check_empty_lines
    offenses << 4
  end
end
