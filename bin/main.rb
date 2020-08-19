#!/usr/bin/env ruby
require_relative '../lib/check.rb'
require 'strscan'
require 'colorize'

file = File.open('../code/code.css')
file_data = file.readlines.map(&:chomp)

check_errors = Check.new(file_data)

offenses = check_errors.offenses


 if offenses.empty?
   puts('1 file inspected,' + ' no offenses'.green + ' detected')
else
  puts('1 file inspected, ' + (offenses.size.to_s + ' offenses').red + ' detected')
end
