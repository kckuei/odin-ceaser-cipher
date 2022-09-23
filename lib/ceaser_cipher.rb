# lib/ceaser_cipher.rb

# Implements a caesar cipher that takes in a string and the shift factor and then outputs the modified string
# Must preserve case; don't forget to wrap from Z to A
# ASCI ranges: A-Z: 65-90, a-z: 97-122
def caesar_cipher(string, shift_by)
  code_points = string.codepoints
  new_str = ''
  code_points.each do |code|
    if code >= 65 && code <= 90
      shifted = (code + shift_by - 65) % 26 + 65
      puts shifted
      new_str << shifted.chr
    elsif code >= 97 && code <= 122
      shifted = (code + shift_by - 97) % 26 + 97
      puts shifted
      new_str << shifted.chr
    else
      new_str << code.chr
    end
  end
  new_str
end

puts caesar_cipher('What a string!', 5)     # "Bmfy f xywnsl!"
