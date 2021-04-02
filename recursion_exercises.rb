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