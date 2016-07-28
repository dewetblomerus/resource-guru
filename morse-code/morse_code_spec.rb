require_relative 'morse_code'

RSpec.describe MorseCode do
  let(:morse) { MorseCode.new }

  it 'turns a string into morse code' do
    expect(
      morse.encode('I AM IN TROUBLE')
    ).to eq('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.')

    expect(
      morse.encode('I')
    ).to eq('..')
  end
end

RSpec.describe Encryptor do
  it 'obfuscates input messages' do
    expect(
      Encryptor.obfuscate('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.')
    ).to eq('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1')

    expect(Encryptor.obfuscate('..')).to eq('2')
  end
end

RSpec.describe Main do
  it 'glues together encoding and encryption' do
    expect(
      Main.prepare_to_send('I AM IN TROUBLE')
    ).to eq('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1')
  end
end
