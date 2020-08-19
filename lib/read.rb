class Read
  attr_reader :file, :hash
  def initialize(file_data)
    @file_data = file_data
    @hash = indexing
  end

  def indexing
    hash = []
    @file_data.each_with_index do |line, id|
      hash[id] = line
    end
    hash
  end
end
