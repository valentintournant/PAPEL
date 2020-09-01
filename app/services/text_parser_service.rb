class TextParserService

  # TODO: implement the TextParserService for Alexesens

  def initialize(text)
    @text = text
  end

  def call
    # 1. find the store name
    return parse_decathlon_receipt if @text.downcase.include? 'decathlon'

    return parse_alexesens_receipt if true # TODO: (5) replace it

    # ticket is not yet know
    { amount: 'unknow ticket' }
  end

  def parse_decathlon_receipt
    puts "it is a decathlon ticket !!!"

    amount = @text.split('TOTAL')[1].split('€')[0].strip.to_f

    return { amount: amount, category_name: 'sport' }
  end

  def parse_alexesens_receipt
    # TODO: (6) split,strip on the @text

    # TODO: (7) return a Receipt.new()
  end

end
