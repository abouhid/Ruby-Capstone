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
  let(:file_data) { file.file_scanned }

  describe ' #check_indentation' do
    it 'Checks the indentation of the first lines of code.css' do
      expect(check.check_indentation).to eql
    end
  end
end
