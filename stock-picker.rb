def stock_picker(array)
  result = Hash.new
  array_current = array
  largest_profit = 0

  0.upto(array.length-1) do |index|
    array_price = array_current.map { |value| value - array_current[0] }
    if array_price.max > largest_profit
      largest_profit = array_price.max

      # Find the index of the largest profit + add the index offset
      result[index] = array_price.find_index(largest_profit) + index
    end

    # Update array_current to start on the next index because Buy before sell.
    array_current = array[index+1..-1]
  end

  # Get the last array member which contains latest largest profit
  p result.to_a[-1]
end

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1, 4]