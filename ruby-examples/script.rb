require 'pry'

def double_words_in_phase(string)
  string_array = string.split(' ')

  # binding.pry

  string_array.map { |word| word * 2 }
  string_array.join(' ')
end

double_words_in_phase('This is a test')
