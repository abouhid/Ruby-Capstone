#  require_relative '../bin/main.rb'
#  require_relative '../lib/load.rb'
#  require_relative '../lib/errors.rb'
require_relative '../lib/check.rb'
require 'nokogiri'
require 'strscan'
require 'colorize'
describe Check do
  let(:path) { Dir.glob('../**/code.css').join }
  let(:file) { Load.new(path) }
  let(:check) { Check.new(file.file_scanned, file.file_path, file.file_data) }
  let(:file_scanned) { file.file_scanned }
  let(:file_data) { file.file_data }

  describe ' #check_empty_lines' do
    it 'Checks that no error is returned when the code does not find more than one empty line' do
      expect(check.check_empty_lines(file_data, 5)).to eql(nil)
    end
    it 'Checks that a error is returned when the code finds more than one empty line' do
      expect(check.check_empty_lines(file_data, 12)).to eql('error')
    end
  end

  describe ' #check_indentation' do
    it 'Checks the indentation of the first line from code.css' do
      expect(check.check_indentation(file_scanned, file_data[0], 0)).to eql(0)
    end
    it 'Checks the indentation of the second line from code.css' do
      expect(check.check_indentation(file_scanned, file_data[1], 1)).to eql(4)
    end
    it 'Checks the indentation of the third line from code.css' do
      expect(check.check_indentation(file_scanned, file_data[2], 2)).to eql(2)
    end
  end
end