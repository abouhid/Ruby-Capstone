require_relative '../lib/check.rb'
require_relative '../lib/load.rb'
require 'strscan'

module Errors
  def check_indentation(file_scanned, file_data, line)
    indentation = level_indent(file_scanned)
    if file_data[/\A */].size != indentation[line]
      offenses << file_path.to_s.blue + "\n:#{line + 1}:".cyan + 'Warning: '.yellow +
                  'X'.red + ' Expected correct indentation'
      indentation[line]
    end
    file_data[/\A */].size
  end

  def level_indent(file_scanned)
    cur_lvl = 0
    all_lvl = []
    file_scanned.each_with_index do |line, i|
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

  # rubocop:disable Style/GuardClause
  def check_empty_lines(file_data, line)
    if file_data[line] == '' && file_data[line - 1] == ''
      offenses << file_path.to_s.blue + "\n:#{line + 1}:".cyan +
                  'Warning: '.yellow + 'Layout/EmptyLines: Extra blank line detected.'
      'error'
    end
  end
  # rubocop:enable Style/GuardClause

  def space_before(ind, line, ele)
    line.reset
    char = Regexp.new(ele)
    str = line.scan_until(char)
    while line.matched?
      str = StringScanner.new(str.reverse)
      str.skip(char)
      str.scan(/\s+/)
      if ele == '{'
        if str.matched != ' '
          offenses << file_path.to_s.blue + "\n:#{ind}:".cyan + 'Warning: '.yellow +
                      'X'.red + " Expected single space before \"#{ele}\""
        end
        str = line.scan_until(char)
      elsif ele == ';'
        if str.matched == ' '
          offenses << file_path.to_s.blue + "\n:#{ind}:".cyan + 'Warning: '.yellow +
                      'X'.red + " Unexpected single space before \"#{ele}\""
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
      if line.matched != ' '
        offenses << file_path.to_s.blue + "\n:#{ind + 1}:".cyan + 'Warning: '.yellow +
                    'X'.red + " Expected single space after \"#{ele}\""
      end
      line.scan_until(char)
    end
  end
end
