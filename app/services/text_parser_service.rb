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
      address: '2 Rue des Tanneurs 59000 Lille'
    }
  end

  def parse_uniqlo_receipt

    p "=========== text========="
    p @text
    puts "it is a Uniqlo ticket"
    date = @text.match(/(?:(?:(?:0[1-9]|1\d|2[0-8])\/(?:0[1-9]|1[0-2])|(?:29|30)\/(?:0[13-9]|1[0-2])|31\/(?:0[13578]|1[02]))\/[1-9]\d{3}|29\/02(?:\/[1-9]\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00))/)[0]
    store = @text.downcase.split('www.')[1].split('.')[0]
    amount = @text.split('EUR')[1].split[0].to_f

    raise
    address = @text.split('Uniqlo')[1].split[0] + " " + @text.split(',')[1].split('TVA')[0].strip

      return {
        amount: amount,
        category_name: 'shopping',
        store: 'Uniqlo',
        description: nil,
        date: date,
        address: address
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
