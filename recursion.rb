# write a method fibs, which will return the sequence of fibanacci numbers, using iteration

def fibs(n)
  arr = []
  arr[0], arr[1] = 0, 1
  (2..n).each do |idx|
    sum = arr[idx - 1] + arr[idx - 2]
    arr << sum
  end
  return arr[n]
end

def fibs_rec(n)
  return 1 if n == 1 || n == 2
  return fibs_rec(n-1) + fibs_rec(n-2)
end

#notes about merge_sort
#pivot element. every element will be compared to this pivot element.
def merge_sort(arr)
  return arr if arr.length <= 1

  pivot_element = [arr.first]

  left_side = arr[1..-1].select { |el| el < arr.first }
  right_side = arr[1..-1].select { |el| el >= arr.first }

  merge_sort(left_side) + pivot_element + merge_sort(right_side)
end

puts merge_sort([1,5,8,3,6,2,9,4])
