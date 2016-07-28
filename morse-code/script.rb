require_relative 'lib/morse_code'

File.open('encoded_obfuscated_message.txt', 'w') do |file|
  File.readlines('plain_text_message.txt').each do |line|
    file.puts Main.prepare_to_send(line)
  end
end
