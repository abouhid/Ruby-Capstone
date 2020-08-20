class Load
  attr_reader :file_path, :file_data, :file, :file_scanned
  def initialize(path)
    @file_path = File.expand_path(path)
    @file = File.open(@file_path.to_s)
    @file_data = file.readlines.map(&:chomp)
    @file_scanned = file_data.map { |line| StringScanner.new(line) }
  end
end
