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

