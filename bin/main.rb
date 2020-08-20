#!/usr/bin/env ruby
require_relative '../lib/check.rb'
require 'nokogiri'
require 'strscan'
require 'colorize'
include Errors

path = Dir.glob('../**/**.css').join
file = Load.new(path)
check = Check.new(file.file_scanned, file.file_path)
puts check.offenses.size
# offenses = check_errors.offenses
#  if offenses.empty?
#    puts('1 file inspected,' + ' no offenses'.green + ' detected')
# else
#   puts('1 file inspected, ' + (offenses.size.to_s + ' offenses').red + ' detected')
# end
