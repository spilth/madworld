require 'squib'

card = Squib.csv file: 'cards.csv'

Squib::Deck.new(cards: card['name'].size, layout: 'layout.yml') do
  background color: 'white'

  rect layout: 'bleed'
  rect layout: 'cut'
  rect layout: 'safe'

  text str: card['name'], layout: 'name'

  text str: card['type'], layout: 'type-name'
  svg file: card['type'].map { |t| "#{t.downcase}.png" }, layout: 'type-icon'

  text str: card['quote'], layout: 'quote'

  save_png prefix: card['type']
  save_pdf file: 'Cards.pdf', gap: 0
  # showcase file: 'Characters.png', range: 0..9
end
