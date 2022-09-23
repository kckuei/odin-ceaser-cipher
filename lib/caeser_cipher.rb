# lib/caeser_cipher.rb

# CaeserCipher class
class CaeserCipher
  # Implements a caesar cipher that takes in a string and shift factor as input
  # and outputs the modified stringm while preserving case
  # ASCI ranges: A-Z: 65-90, a-z: 97-122
  def cipher(string, shift_by)
    code_points = string.codepoints
    new_str = ''
    code_points.each do |code|
      if code >= 65 && code <= 90
        shifted = (code + shift_by - 65) % 26 + 65
        new_str << shifted.chr
      elsif code >= 97 && code <= 122
        shifted = (code + shift_by - 97) % 26 + 97
        new_str << shifted.chr
      else
        new_str << code.chr
      end
    end
    new_str
  end
end
