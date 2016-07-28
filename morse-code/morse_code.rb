require 'pry'
module Main
  def self.prepare_to_send(input_message)
    morse = MorseCode.new
    encoded_message = morse.encode(input_message)
    encrypted_message = Encryptor.obfuscate(encoded_message)
    encrypted_message
  end
end

class MorseCode
  def initialize
    load_encoder_hash('international_morse_code_conversion.txt')
  end

  def encode(message)
    array_message = message.chars
    encoded_array = []
    array_message.each_with_index do |char, i|
      encoded_array << @encoder_hash[char]
      encoded_array << "|" if letters?(char, array_message[i+1])
    end
    encoded_array.join
  end

  def letters?(first, second)
    first =~ /\w/ && second =~ /\w/
  end

  def load_encoder_hash(file)
    @encoder_hash = {}
    File.readlines(file).each do |line|
      pair_array = line.split(" ")
      @encoder_hash[pair_array[0]] = pair_array[1]
    end
    @encoder_hash[" "] = "/"
  end
end

module Encryptor
  def self.obfuscate(morse_code)
    dashes_counted = count_chars(morse_code, "-", /(-+)/)
    numbers_converted = convert_numbers(dashes_counted)
    dots_counted = count_chars(numbers_converted, ".", /(\.+)/)
    dots_counted
  end

  def self.count_chars(morse_code, count_this, regex)
    chars_isolated = morse_code.split(regex)
    chars_isolated.shift if chars_isolated[0] == ""
    chars_counted_arr = []
    chars_isolated.each do |str|
      if str[0] == count_this
	chars_counted_arr << str.size
      else
	chars_counted_arr << str
      end
    end
    chars_counted_arr.join
  end

  def self.convert_numbers(with_numbers)
    to_letters = with_numbers.chars.map do |char|
      if char =~ /\d/
	NUMBER_TO_LETTER[char]
      else
	char
      end
    end
    to_letters.join
  end

  NUMBER_TO_LETTER = {
    "1" => "A",
    "2" => "B",
    "3" => "C",
    "4" => "D",
    "5" => "E",
    "6" => "F",
    "7" => "G",
    "8" => "H",
    "9" => "I"
  }
end
