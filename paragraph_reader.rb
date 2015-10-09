class ParagraphReader


  def initialize

  # we use while true to repeat the program and provide multiple paragraphs
  # the program finishes when the user close the process using ctrl + c

  while true

    #we have to validate when the user provides a number
    #when the user provides a paragraph we continue to the next step ( decode the paragraph)

    begin
      paragraph = get_paragraph
      if  validates_number(paragraph)
        puts "you've provided a number"
      end

    end while validates_number(paragraph)

    puts 'continue decoding the paragraph'
    decode_paragraph(paragraph)

  end

  end

  # we use gets to return the user input
  # chomp to remove the line break

  def get_paragraph

    puts 'Provide a paragraph'

    paragraph = gets.chomp

    puts "This is the paragraph provided\n"

    puts "#{paragraph} \n"

    return paragraph

  end

  def decode_paragraph(paragraph)

    #put all the words in an array

    puts 'Including all the words in one array'

    # we use a regular expression to insert each word separated by space
    # in a paragraph we might have numbers so the next step is delete the numbers

    wordsArray = paragraph.downcase.split(/\W+/)

    puts 'deleting all numbers in the array'

    wordsArray.each do |word|
      if validates_number(word)
        wordsArray.delete(word)
      end
    end

    puts 'read and count all the words'

    # when the array is 'clean' we use inject to get each word and the number of times that this word appears
    # each word and word_count are inserted in a hash

    counter =  wordsArray.inject(Hash.new(0)) { |hash,value| hash[value] += 1; hash }
    puts counter

  end

  # this method validates if we provided a number or text
  # If the param is text the method rescues the exception and return false

  def validates_number(param)
    Float(param) != nil rescue false
  end

end