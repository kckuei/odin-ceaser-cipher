# spec/caeser_cipher_spec.rb
require './lib/caeser_cipher' # this is relative to the .rspec file

describe CaeserCipher do
  describe '#cipher' do
    before { @caeser_cipher = CaeserCipher.new }

    context 'Handles shifts on (0, 26)' do
      it "Shifts 'What a string' by 5 places to 'Bmfy f xywnsl!'" do
        expect(@caeser_cipher.cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
      end

      it "Shifts 'What a string' by 10 places to 'Grkd k cdbsxq!'" do
        expect(@caeser_cipher.cipher('What a string!', 10)).to eql('Grkd k cdbsxq!')
      end
    end

    context 'Handles zero shifts 0, or 26' do
      it 'Returns the original string when shifted by 0' do
        expect(@caeser_cipher.cipher('What a string!', 0)).to eql('What a string!')
      end

      it 'Returns the original lowercase string when shifted by 26' do
        expect(@caeser_cipher.cipher('hello, world!', 26)).to eql('hello, world!')
      end
    end

    context 'Handles case preservations' do
      it 'Returns the original uppercase string when shifted by 26' do
        expect(@caeser_cipher.cipher('HELLO, WORLD!', 26)).to eql('HELLO, WORLD!')
      end

      it 'Returns the original mixed case string when shifted by 26' do
        expect(@caeser_cipher.cipher('HELLO, world!', 26)).to eql('HELLO, world!')
      end

      it 'Returns the original uppercase string when shifted by 7' do
        expect(@caeser_cipher.cipher('HELLO, WORLD!', 7)).to eql('OLSSV, DVYSK!')
      end

      it 'Returns the original mixed case string when shifted by 18' do
        expect(@caeser_cipher.cipher('HELLO, world!', 18)).to eql('ZWDDG, ogjdv!')
      end
    end

    context 'Handles empty string' do
      it 'Returns the original string' do
        expect(@caeser_cipher.cipher('', 10)).to eql('')
      end
    end

    context 'Handles special characters' do
      it 'Returns the original special characters preserved' do
        expect(@caeser_cipher.cipher('Ic53@sH3lls_by_th3_se@_shor3', 0)).to eql('Ic53@sH3lls_by_th3_se@_shor3')
      end
      it 'Returns a string with original special characters preserved when shifted' do
        expect(@caeser_cipher.cipher('Ic53@sH3lls_by_th3_se@_shor3', 3)).to eql('Lf53@vK3oov_eb_wk3_vh@_vkru3')
      end
    end
  end
end
