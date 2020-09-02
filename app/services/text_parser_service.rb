class TextParserService
  # TODO: implement the TextParserService for Alexesens

  def initialize(text)
    @text = text
  end

  def call

    return parse_uniqlo_receipt if @text.downcase.include? 'uniqlo'
    return parse_decathlon_receipt if @text.downcase.include? 'decathlon'
    return parse_so_good_receipt if @text.downcase.include? 'sogood'
    # ticket is not yet know
    { amount: 'unknow ticket' }
  end

  def parse_decathlon_receipt
    puts "it is a decathlon ticket"

    amount = @text.split('TOTAL')[1].split('€')[0].strip.to_f

    return {
      amount: amount,
      category_name: 'entertainment',
      store: 'Decathlon',
      description: nil,
      date: '2020 august 20',
      address: '2 Rue des Tanneurs 59000 Lille',
    }
  end

  def parse_uniqlo_receipt
    puts "it is a Uniqlo ticket"

    return {
      amount: amount,
      category_name: 'shopping',
      store: 'Uniqlo',
      description: nil,
      date: date,
      address: address,
    }
  end

  def parse_so_good_receipt

    puts "it is a So Good ticket"
    # TODO: (6) split,strip on the @text
    amount = @text.split('TOTAL TICKET')[1].split('/')[0].strip.to_f
    address = @text.split('EURATECHN')[1].split('49000')[0].strip + " " + @text.split('49000')[1].split('FRANCE')[0].strip
    date = @text.downcase.split('vente')[1].split[0]
    # TODO: (7) return a Receipt.new()
    return {
      amount: amount,
      category_name: 'restaurant',
      store: 'Sogood',
      description: nil,
      date: date,
      address: address,
    }
  end
end
