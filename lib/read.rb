class Read
  attr_reader :file, :hash
  def initialize(file_data)
    @file_data = file_data
    @hash = indexing
    puts __FILE__ 
    puts Dir.pwd
  end

  def indexing
    hash = {}
    @file_data.each_with_index do |line, id|
      hash[id] = line
    end
    hash
  end
end
file = File.open('./code/code.css')
file_data = file.readlines.map(&:chomp)

a = Read.new(file_data)
