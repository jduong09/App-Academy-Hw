# Exercise 1
def sum_to(n)
  return 1 if n == 1
  return nil if n < 0

  n + sum_to(n - 1)
end

# Exercise 2
def add_numbers(array)
  return nil if array.length == 0
  return array[0] if array.length == 1

  array[0] + add_numbers(array[1..-1])
end

# Exercise 3
# gamma(n) = (n-1)
def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

# Exercise 4
def ice_cream_shop(array, flavor)
  return false if array.empty?
  return true if array[0] == flavor

  ice_cream_shop(array[1..-1], flavor)

end

# Exercise 5
def reverse(string)
  return "" if string == ""

  string[-1] + reverse(string[0...-1])
end