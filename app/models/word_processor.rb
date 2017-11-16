class WordProcessor
  attr_accessor :tree

  def initialize
  end

  def process_wordlist(file_path)
      return unless File.exist?("#{file_path}")
      wordlist = read_in_words(file_path)
      wordlist.uniq!
      sorted_list = wordlist.sort {|right, left| left.length <=> right.length }

      wordtree = false
      @tree = Array.new

      sorted_list.each_with_index do |word, index|
        wordtree = compare(word, word.length, sorted_list, index)
        break if wordtree
      end

      return "That list of words doesn't contain a wordtree" unless wordtree
      format_tree
      @tree
    end

    def format_tree
      @tree = @tree.uniq
      @tree.sort! {|left, right| left.length <=> right.length }
    end

    def read_in_words(file_path)
      words = Array.new
      File.open("#{file_path}").each do |line|
        words << line.chop.downcase
      end
      words
    end

    def compare(my_word, my_length, wordlist, my_index)
      if my_length == 3
        @tree << my_word
        return true
      else
        wordlist.each_with_index do |word, index|
            if word.length == my_length - 1 && match?(my_word, word)
              @tree << my_word
              value = compare(word, word.length, wordlist, index)
              if value
                return true
              end
            elsif index == (wordlist.length - 1)
                @tree.delete(my_word)
                return false
            else
              next
            end
        end
      end
    end

    # checks if all letters in shorter word exist in the longer word
    def match?(longer_word, shorter_word = "")
      index = shorter_word.length - 1
      match = true
      temp = longer_word.dup
      while(index > -1 && match)
        if temp.include?(shorter_word[index])
          char = shorter_word[index]
          long_string_index = temp.index(char)
          temp[long_string_index] = ''
          index -= 1
        else
          match = false
        end
      end
      match
    end
end
