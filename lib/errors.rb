require_relative "../lib/check.rb"
require_relative "../lib/load.rb"
require "strscan"

module Errors
  def check_indentation(file_data)
    counter = 0
  end

  def check_closing
    # file_data.size.times do |i|

    # end
  end

  def check_empty_lines
    file = Load.new(file_path)
    code = file.file_data.to_a
    code.size.times do |i|
      pl = i - 1
      cl = i
      if code[i] == "" && code[pl] == ""
        puts file_path.to_s.blue + "\n:#{i}:".cyan + 
        "Warning: ".yellow + "Layout/EmptyLines: Extra blank line detected."
        offenses << 1
      end
    end
  end

  def space_before(next_l, line, ele)
    line.reset
    char = Regexp.new(ele)
    str = line.scan_until(char)
    while line.matched?
      str = StringScanner.new(str.reverse)
      str.skip(char)
      str.scan(/\s+/)
      if ele == "{"
        if str.matched != " "
          puts file_path.to_s.blue + "\n:#{next_l}:".cyan + "Warning: ".yellow +
               "X".red + " Expected single space before \"#{ele}\""
          offenses << 1
        end
        str = line.scan_until(char)
      elsif ele == ";"
        if str.matched == " "
          puts file_path.to_s.blue + "\n:#{next_l}:".cyan + "Warning: ".yellow +
               "X".red + " Unexpected single space before \"#{ele}\""
          offenses << 1
        end
        str = line.scan_until(char)
      end
    end
  end

  def space_after(next_l, line, ele)
    line.reset
    char = Regexp.new(ele)
    line.scan_until(char)
    while line.matched?
      line.scan(/\s+/)
      if line.matched != " "
        puts file_path.to_s.blue + "\n:#{next_l}:".cyan + "Warning: ".yellow +
             "X".red + " Expected single space after \"#{ele}\""
        offenses << 1
      end
      line.scan_until(char)
    end
  end
end
