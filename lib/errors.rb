require_relative "../lib/check.rb"
require_relative "../lib/load.rb"
require "strscan"

module Errors
  def check_indentation(file_data)
    file = Load.new(file_path)
    code = file.file_data.to_a
    indentation = level_indent(file_data)
    code.each_with_index do |line, i|
      if line[/\A */].size != indentation[i]
        puts file_path.to_s.blue + "\n:#{i}:".cyan + "Warning: ".yellow +
               "X".red + " Expected correct indentation"
        offenses << 1
      end
    end
  end

  def level_indent(file_data)
    cur_lvl = 0
    all_lvl = Array.new
    file_data.each_with_index do |line, i|
      line.reset

      all_lvl << cur_lvl

      if line.exist?(/{/)
        cur_lvl += 2
      elsif line.exist?(/}/)
        cur_lvl -= 2
        all_lvl[i] = cur_lvl
      end
    end
    all_lvl
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

  def space_before(ind, line, ele)
    line.reset
    char = Regexp.new(ele)
    str = line.scan_until(char)
    while line.matched?
      str = StringScanner.new(str.reverse)
      str.skip(char)
      str.scan(/\s+/)
      if ele == "{"
        if str.matched != " "
          puts file_path.to_s.blue + "\n:#{ind}:".cyan + "Warning: ".yellow +
               "X".red + " Expected single space before \"#{ele}\""
          offenses << 1
        end
        str = line.scan_until(char)
      elsif ele == ";"
        if str.matched == " "
          puts file_path.to_s.blue + "\n:#{ind}:".cyan + "Warning: ".yellow +
               "X".red + " Unexpected single space before \"#{ele}\""
          offenses << 1
        end
        str = line.scan_until(char)
      end
    end
  end

  def space_after(ind, line, ele)
    line.reset
    char = Regexp.new(ele)
    line.scan_until(char)
    while line.matched?
      line.scan(/\s+/)
      if line.matched != " "
        puts file_path.to_s.blue + "\n:#{ind}:".cyan + "Warning: ".yellow +
             "X".red + " Expected single space after \"#{ele}\""
        offenses << 1
      end
      line.scan_until(char)
    end
  end
end
