require 'squib'

card = Squib.csv file: 'cards.csv'

module SpilthAdditions
  refine Array do
    def select_indexes
      each_with_index.inject([]) do |indexes, (value, index)|
        indexes << index if yield value
        indexes
      end
    end

    def reject_indexes
      each_with_index.inject([]) do |indexes, (value, index)|
        indexes << index unless yield value
        indexes
      end
    end
  end
end

using SpilthAdditions

Squib::Deck.new(cards: card['name'].size, layout: 'layout.yml') do
  background color: 'white'

  rect layout: 'bleed'
  rect layout: 'cut'

  png file: 'background.png', layout: 'background'

  rect layout: 'safe'

  text str: card['name'], layout: 'name'

  text str: card['type'], layout: 'type-name'
  svg file: card['type'].map { |t| "#{t.downcase}.svg" }, layout: 'type-icon'

  text str: card['description'], layout: 'description'
  text str: card['quote'], layout: 'quote'

  png file: card['image'], layout: 'image', range: card['image'].reject_indexes(&:nil?)
  rect layout: 'image-border', range: card['image'].reject_indexes(&:nil?)

  save_png
  save_pdf file: 'Cards.pdf', gap: 0
end
