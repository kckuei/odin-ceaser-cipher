# spec/caeser_cipher_spec.rb
require './lib/caeser_cipher' # this is relative to the .rspec file

describe CaeserCipher do
  it "Shifts 'What a string' by 5 places to 'Bmfy f xywnsl!'" do
    caeser_cipher = CaeserCipher.new
    expect(caeser_cipher.cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
  end
end
