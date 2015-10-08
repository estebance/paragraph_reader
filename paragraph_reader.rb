class ParagraphReader


  def initialize

    puts 'Provide a paragraph'
    paragraph = gets.chomp

    puts "This is the paragraph provided\n"

    puts "#{paragraph} \n"

    #validates if  it is a paragraph

    if !validates_number(paragraph) #.is_a? Numeric

      puts "continue"
      decode_paragraph(paragraph)

    else

      puts "you've provided a number"

    end





  end


  def validates_number(param)
    Float(param) != nil rescue false
  end


  def decode_paragraph(paragraph)

    #put all the words in an array
    wordsArray = paragraph.downcase.split(/\W+/)


    #read all the words

    counter =  wordsArray.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    puts counter



  end


end