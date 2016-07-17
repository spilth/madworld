require 'squib'

card = Squib.csv file: 'cards.csv'

Squib::Deck.new(cards: card['name'].size, layout: 'layout.yml') do
  background color: 'white'

  rect layout: 'bleed'
  rect layout: 'cut'
  rect layout: 'safe'

  text str: card['name'], layout: 'name'
  text str: card['type'], layout: 'type-name'

  text str: card['quote'], layout: 'quote'

  svg file: card['type'], layout: 'type-icon'

  save format: :png
  save_pdf file: 'all-cards.pdf', gap: 0
end
