
# O(n^2) time
def biggest_fish(fish)
  fish.each_with_index do |fish1, idx1|
    longest = true
    fish.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      if fish2.length > fish1.length
        longest = false
    end

    return fish1 if longest
  end
end


# O(n log n) time
class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y}
    return self if count <= 1

    mid = self.length / 2
    left, right = self.take(mid), self.drop(mid)
    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end
end

def biggest_fish(fish)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fish.merge_sort(&prc).last
end

# O(n) time
def linear_biggest_fish(fish)
  biggest = fish.first
  fish.each do |current_fish|
    if current_fish.length > biggest.length
      biggest = current_fish
    end
  end

  biggest
end


tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

def slow_dance(direction, tiles)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7}

def fast_dance(direction, tiles)
  tiles_hash[direction]
end
