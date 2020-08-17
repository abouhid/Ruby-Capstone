#!/usr/bin/env ruby

require 'strscan'
require 'colorize'

s = StringScanner.new('test string')

offenses = 1

if offenses.zero?
  puts(' files inspected,' + ' no offenses'.green + ' detected')
else
  puts(' files inspected, ' + (offenses.to_s + ' offenses').red + ' detected')
end
