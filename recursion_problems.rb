#Problem 1:
#You have array of integers. 
#Write a recursive solution to find the sum of the integers.
def sum_recur(array)
  return 0 if array.empty?
  
  array[0] + sum_recur(array[1..-1])
end

#puts sum_recur([1, 2, 3, 4, 5])
#puts sum_recur([])
#puts sum_recur([10, 34, 25])

#Problem 2: 
#You have array of integers. 
#Write a recursive solution to determine whether or not the array contains a specific value.
def includes?(array, target)
  return false if array.empty?
  
  return true if array[0] == target

  includes?(array[1..-1], target)
end

#puts includes?([1, 2, 3], 0)
#puts includes?([1, 2, 3], 1)

# Problem 3: 
#You have an unsorted array of integers. 
#Write a recursive solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.empty?
  
  occurrences = 0

  if array[0] == target
    occurrences = 1
  end

  occurrences + num_occur(array[1..-1], target)
end

#puts num_occur([0, 5, 3, 7, 1, 3], 3)

# Problem 4: 
#You have array of integers. 
#Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.
def add_to_twelve?(array)
  return [] if array.length == 1

  if array[0] + array[1] == 12
    result = true
  else
    result = false
  end

  seq = add_to_twelve?(array[1..-1])

  seq.unshift(result)
end

#add_to_twelve?([1, 4, 7, 5, 7, 3])

# Problem 5: 
#You have array of integers. 
#Write a recursive solution to determine if the array is sorted.
def sorted?(array) # sorted ascending.
  return true if array.empty?
  return true if array.length == 1

  return false if array[0] > array[1]

  sorted?(array[1..-1])
end

#puts sorted?([1, 2, 3, 4, 5])
#puts sorted?([5, 6, 3, 2, 1])

# Can we check if an array if sorted ascending or descending?

# Problem 6: 
#Write a recursive function to reverse a string. 
#Don't use any built-in #reverse methods!
def reverse(string)
  return "" if string.length == 0

  string[-1] + reverse(string[0...-1])
end

#puts reverse("hello")
#puts reverse("butt")
