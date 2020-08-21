require_relative '../lib/check.rb'
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
      expect(check.check_empty_lines(file_data, 12)).not_to eql(nil)
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

  describe ' #space_before' do
    it 'Tests first line in which the code does not find a \'{\' without a space before it' do
      expect(check.space_before('{', file_scanned[0], 0)).to eql(nil)
    end
    it 'Tests eigth line in which the code finds a \'{\' without a space before it' do
      expect(check.space_before('{', file_scanned[7], 7)).to eql(' Expected single space before "{"')
    end
    it 'Tests ninth line in which the code finds a space before \';\'' do
      expect(check.space_before(';', file_scanned[8], 8)).to eql(' Unexpected single space before ";"')
    end
    it 'Tests tenth line in which the code does not find a space before \';\'' do
      expect(check.space_before(';', file_scanned[9], 9)).to eql(nil)
    end
  end
  describe ' #space_after' do
    it 'Tests fith line in which the code finds a \',\' without a space after it' do
      expect(check.space_after(',', file_scanned[4], 4)).to eql(' Expected single space after ","')
    end
    it 'Tests sixth line in which the code does not find a \',\' without a space after it' do
      expect(check.space_after(',', file_scanned[5], 5)).to eql(nil)
    end
    it 'Tests eigth line in which the code does not find a \':\' without a space after it' do
      expect(check.space_after(':', file_scanned[7], 7)).to eql(nil)
    end
    it 'Tests ninth line in which the code finds a \':\' without a space after it' do
      expect(check.space_after(':', file_scanned[8], 8)).to eql(' Expected single space after ":"')
    end
  end
end
