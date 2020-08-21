describe Load do
  let(:path) { Dir.glob('../**/code.css').join }
  let(:file) { Load.new(path) }

  describe ' #initialize' do
    it 'Checks if the file is loaded as an array containing the code.css lines' do
      expect(file.file_data[1]).to eql('    font-size: 12pt;')
    end
    it 'Checks if the path is loaded correctly' do
      expect(file.file_path[-14..-1]).to eql('/code/code.css')
    end
  end
end
