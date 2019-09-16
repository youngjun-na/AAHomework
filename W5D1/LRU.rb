 class LRUCache
    attr_reader :size, :cache
    def initialize(n)
      @cache = []
      @size = n
    end

    def count
      cache.count
    end

    def add(el)
      if cache.include?(el)
        cache.delete(el)
        cache.push(el)
      else
        cache.shift if cache.count == size
        cache.push(el)
      end
      
    end

    def show
      @cache
    end

  end
   johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line") 
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]