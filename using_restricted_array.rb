require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  until array[i] == nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
def print_array(array)
    i = 0
    until array[i] == nil
      puts array[i]
      i += 1
    end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  until array[length - 1] < 0
    return true if array[length - 1] == value_to_find
    length -= 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  max = array[0]
  length = length - 1
  until length == 0
    if array[length] > max
      max = array[length]
    end
    length -= 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  min = array[0]
  length = length - 1
  until length == 0
    min = array[length - 1] if array[length - 1] < min
    length -= 1
  end
  return min
end

# Reverses the values in the integer array in place
def reverse(array, length)
  i = 0
  until i == length/2
    array[i] = array[i] + array[length - 1]
    array[length - 1] = array[i] - array[length - 1]
    array[i] = array[i] - array[length - 1]
    i += 1
    length -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  left = 0
  right = length - 1
  marker = (right - left)/2
  until left > right
    if array[marker] < value_to_find
      left = marker + 1
    elsif array[marker] > value_to_find
      right = marker - 1
    else
      return true
    end
  end
  false

end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---

# A restricted array could be constructed of a given size like so
puts "---Test 1: Check length --"
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
puts "The length of my integer array is #{my_integer_array_length}, which should be the same as #{size}."
puts "BUG!" if my_integer_array_length != size
puts

# A restricted array could be constructed of a random size (1 to 20) like so
another_array = RestrictedArray.new()
another_array_length = length(another_array)
puts "The length of my random length, integer array is #{another_array_length}."
puts

puts "---Test 2: Print values --"
# print the current array
print "Printing values in the array: "
print_array(another_array)

puts "---Test 3: Linear Search --"
# search for value_to_find in the array
value_to_find = 120
middle_index = another_array_length/2
another_array[middle_index] = value_to_find
print "Printing values in the array after inserting #{value_to_find} at #{middle_index}: "
print_array(another_array)
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "BUG! #{value_to_find} not found in the array! It should be at index #{middle_index}"
end
puts

# search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

puts "---Test 4: Find largest --"
# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

puts "---Test 5: Find smallest --"
# print the smallest value in the array
smallest = find_smallest(another_array, another_array_length)
puts "The smallest value in the array is #{smallest}"
puts

puts "---Test 6: Reverse array --"
# reverse the values in the current array
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts

puts "Sorting array"
# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

puts "---Test 7: Find largest in sorted array--"
# print the largest value in the array
largest = find_largest(another_array, another_array_length)
if largest == another_array[another_array_length-1]
  puts "The largest value in the array is #{largest}"
else
  puts "BUG! The largest value in the array should be #{another_array[another_array_length-1]} and not #{largest}."
end
puts

puts "---Test 8: Find smallest in sorted array --"
# print the smallest value in the array
smallest = find_smallest(another_array, another_array_length)
if smallest == another_array[0]
  puts "The smallest value in the array is #{smallest}"
else
  puts "BUG! The smallest value in the array should be #{another_array[0]} and not #{smallest}."
end
puts

puts "---Test 9: Seach in sorted array --"
# search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the sorted array with linear search!"
else
  puts "#{value_to_find} not found in the sorted array with linear search!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts
# binary search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if binary_search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the sorted array with binary search!"
else
  puts "#{value_to_find} not found in the sorted array with binary search!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

puts "---Test 10: Reverse array --"
# reverse the values in the current array
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts
puts "---Test 11: Find largest in sorted, reversed array--"
# print the largest value in the array
rev_largest = find_largest(another_array, another_array_length)
if rev_largest == another_array[0] && rev_largest == largest
  puts "The largest value in the array is #{largest}"
else
  puts "BUG! The largest value in the array should be #{another_array[0]} and not #{rev_largest} and at index 0."
end
puts

puts "---Test 12: Find smallest in sorted, reversed array --"
# print the smallest value in the array
rev_smallest = find_smallest(another_array, another_array_length)
if rev_smallest == another_array[another_array_length-1] && rev_smallest == smallest
  puts "The smallest value in the array is #{smallest}"
else
  puts "BUG! The smallest value in the array should be #{another_array[another_array_length-1]} and not #{smallest},  and at index #{another_array_length-1}."
end
puts
