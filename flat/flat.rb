# Flattens arbitrarily nested arrays
module Flat
  def self.flatten(input_array)
    check_input(input_array)
    @flat_array = []
    nested_iterate(input_array)
    @flat_array
  end

  def self.check_input(input_array)
    unless input_array.is_a?(Array)
      raise ArgumentError, 'Only Arrays are allowed'
    end
  end

  def self.nested_iterate(a)
    a.each do |element|
      if element.class == Array
        nested_iterate(element)
      else
        @flat_array << element
      end
    end
  end
end
