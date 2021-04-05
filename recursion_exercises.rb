#Warmup
#Recursive
def range(start, fin, array = [])
  return if fin < start

  array << start

  range(start + 1, fin, array)

  return array
end

#Iterative
def iter_range(start, fin)
  return [] if fin < start
  array = []
  
  (start..fin).each do |num|
    array << num
  end

  return array
end

# Exponentiation
# 1
  #exp(b, 0) = 1
  #exp(b, n) = b * exp(b, n - 1)

def exp(base, pow)
  return 1 if bow == 0

  base * exp(base, pow - 1)
end

# 2
  #exp(b, 0) = 1
  #exp(b, 1) = b
  #exp(b, n) = exp(b, n / 2) ** 2             [for even n]
  #exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def other_exp(base, pow)
  return 1 if pow == 0
  return base if pow == 1

  #even pow
  return other_exp(base, pow / 2) * other_exp(base, pow / 2) if pow % 2 == 0
  

  #odd pow
  return base * (other_exp(base, (pow - 1) / 2) * other_exp(base, (pow - 1) / 2)) if pow % 2 == 1

end

def deep_dup(array, new_array = [])
  return if array == []

  if array[0].is_a?(Array)
    subArray = []
    array[0].each do |ele|
      dupEle = ele
      subArray << dupEle
    end
    new_array << subArray
  else 
    dupEle = array[0]
    new_array << dupEle
  end
  
  deep_dup(array[1..-1], new_array)

  return new_array
end

#print deep_dup([["nuts", "bolts", "washers"],["capacitors", "resistors", "inductors"]])
#print deep_dup([1, [2], [3, [4]]])

#robot_parts = [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]
#robot_parts_copy = deep_dup(robot_parts)
#robot_parts_copy[1] << "LEDs"

#puts robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
#puts robot_parts_copy[1]

#the fibonacci sequence is a sequence of numbers where the number is the addition of the previous two numbers
#starting at 0, 1
# 0, 1, 1, 2, 3, 5, 8, 13, 21
def fibonacci(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fib = fibonacci(n - 1)

  fib << fib[-2] + fib[-1]

  return fib
end

def iter_fibonacci(n)
  ans = [0, 1]

  (2..n).each do |num|
    ans << ans[num - 2] + ans[num - 1]
  end

  return ans
end

# Bsearch
# find middle element of the array
# check if the num is greater than or less than the middle element
# check the side that the num is on.
def bsearch(array, num)
  return nil if array == []

  mid_element = array.length / 2

  if array[mid_element] ==  num
    return mid_element
  elsif array[mid_element] > num
    calls = bsearch(array[0...mid_element], num)
  elsif array[mid_element] < num
    calls = bsearch(array[mid_element + 1..-1], num)
    calls.nil? ? nil : calls + mid_element + 1
  end
end

# Combine sorted arrays
  # Needs to sort the two arrays into one sorted array.
def merge(array_one, array_two)
  new_array = []

  while !array_one.empty? && !array_two.empty?
    if array_one.first <= array_two.first
      new_array << array_one.first
      array_one = array_one[1..-1]
    else 
      new_array << array_two.first
      array_two = array_two[1..-1]
    end
  end
  
  while !array_one.empty?
     new_array << array_one.first
     array_one = array_one[1..-1]
  end

  while !array_two.empty?
    new_array << array_two.first
    array_two = array_two[1..-1]
  end

  return new_array

end

class Array
  # Divide array in half and call merge_sort on each half
    # do this until you reach base case.
      # base case would be array.length == 1, and array.length == 0
        # this is because [3] and [] are both sorted.
    # use merge helper method to combine sorted arrays
      # [38] merged with [27] should return [27, 38]
  def merge_sort
    return [] if self.length == 0
    return self if self.length == 1

    mid = self.length / 2

    leftside = self[0...mid].merge_sort
    rightside = self[mid..-1].merge_sort

    array = merge(leftside, rightside)

    return array
  end


#array = [6, 3, 2, 4, 1, 7, 9]
#puts array.merge_sort


  # Very confused!
  def subsets
    #base case
    return [[]] if self == []

    #inductive step
    subset = self[0...-1].subsets

    subset.concat( subset.map { |x| x += self[-1]} )
  end
end

#array = [[1]]
#print array.subsets

def bubble_sort(array)
  is_sorted = false

  while is_sorted == false
    is_sorted = true
    (0...array.length - 1).each do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        is_sorted = false
      end
    end
  end
  array
end

#Write a recursive method permutations(array) that calculates all the permutations of the given array. 
#For an array of length n there are n! different permutations.
#So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)
  return [array] if array.length <= 1

  first = array.shift

  perms = permutations(array)

  total = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total
end

#print permutations([1, 2, 3])
# => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

def make_change_iter(amount, coins = [25, 10, 5, 1])
  change = []
 
  until amount == 0
    if amount >= coins[0]
      change << coins[0]
      amount -= coins[0]
    else
      coins.shift
    end

  end
  change
end

#print make_change_iter(39)

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return if amount == 0

  if amount >= coins[0]
    remaining = amount - coins[0]
  else
    greedy_make_change()

end

print greedy_make_change(39)
#[25, 10, 1, 1, 1, 1]
