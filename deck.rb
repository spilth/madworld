require 'squib'

card = Squib.csv file: 'cards.csv'

Squib::Deck.new(cards: card['name'].size, layout: 'layout.yml') do
  rect
  background color: 'white'
  text str: card['name'], layout: 'Name'
  text str: card['type'], layout: 'Type'
  text str: card['quote'], layout: 'Quote'

  save format: :png
end
