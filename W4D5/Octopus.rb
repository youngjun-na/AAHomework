def sluggish_octopus(array)
  array.each do |fish|
    longest = true
    arrach.each do |fish2|
      if fish2.length > fish.length
        longest = false
      end
    end
  end
  return fish if longest == true
end

def dominant_octopus(array, &prc)
  prc ||= (|a,b| a.length <=> b.length)
  mid_i =array.length/2
  left = array.take(mid_i) 
  right = array.drop(mid_i)
  merge(dominant_octopus(left), dominant_octopus(right), &prc)
end

def merge(left, right, &prc)
  merged = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged + left + right
end

def clever_octopus(array)
  longest = ""
  array.each do |fish|
    if fish.length > longest.length
      longest == fish
    end
  end
  longest
end

array = ["up"=>, "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dance(direction, array)
  array.each_with_index do |dir, i|
    return i if dir == direction
  end
end

hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }
def fast_dance(direction, hash)
  hash[direction]
end

