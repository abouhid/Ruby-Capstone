#!/usr/bin/env ruby
require_relative '../lib/check.rb'
require 'strscan'
require 'colorize'

path = Dir.glob('../**/code.css').join
file = Load.new(path)
check = Check.new(file.file_scanned, file.file_path, file.file_data)
offenses = check.offenses.size
if offenses.zero?
  puts('1 file inspected,' + ' no offenses'.green + ' detected')
else
  puts check.offenses
  puts('1 file inspected, ' + (offenses.to_s + ' offenses').red + ' detected')
end
