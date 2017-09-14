def quicksort(array)
  if array.length < 2
    array
  else
    pivot = array[0] # recursive case
    less = array[1..-1].select {|i| i <= pivot} #sub array of all elements less than pivot
    greater = array[1..-1].select {|i| i > pivot} #sub array of elements greater than pivot
    quicksort(less) + [pivot] + quicksort(greater)
    #doesn't work if [pivot] is not in square brackets, WHY??????
  end
end
 puts  quicksort([22,1,4,77])
 #works => 1,4,22,77 , print command doesn't work WHY?????
