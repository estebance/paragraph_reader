class ParagraphReader


  def initialize


  while true

    begin
      paragraph = get_paragraph
      puts "true or false #{validates_number(paragraph)}"
      if  validates_number(paragraph)
        puts "you've provided a number"
      end

    end while validates_number(paragraph)

    puts 'continue decoding the paragraph'
    decode_paragraph(paragraph)

  end

  end


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

    wordsArray = paragraph.downcase.split(/\W+/)

    puts 'deleting all numbers in the array'

    wordsArray.each do |word|
      if validates_number(word)
        wordsArray.delete(word)
      end
    end

    puts 'read and count all the words'

    counter =  wordsArray.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    puts counter

  end

  def validates_number(param)
    Float(param) != nil rescue false
  end

end