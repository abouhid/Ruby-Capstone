#!/usr/bin/env ruby
require_relative '../lib/check.rb'
require 'strscan'
require 'colorize'

s = Check.new('test string for checking errors')

offenses = s.check

puts offenses

# if offenses.zero?
#   puts('1 file inspected,' + ' no offenses'.green + ' detected')
# else
#   puts('1 file inspected, ' + (offenses.to_s + ' offenses').red + ' detected')
# end
