class LRUCache
    def initialize(length)
      @length = length
      @cache = []
    end

    def count
      @cache.length
    end

    def add(item)
      if @cache.include?(item)
        @cache.delete(item)
        @cache << item
      elsif @cache.count == @length
        @cache.shift
        @cache << item
      else
        @cache << item
      end
    end

    def show
      p @cache
    end

    private
    # helper methods go here!

  end
