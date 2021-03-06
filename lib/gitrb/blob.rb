module Gitrb

  # This class stores the raw string data of a blob
  class Blob < Gitrb::Object

    attr_accessor :data, :mode

    # Initialize a Blob
    def initialize(options = {})
      super(options)
      @data = options[:data]
      @mode = options[:mode] || "100644"
    end

    def type
      'blob'
    end

    def ==(other)
      Blob === other and id == other.id
    end

    def dump
      @data
    end

    # Save the data to the git object repository
    def save
      repository.put(self)
      id
    end

  end

end
