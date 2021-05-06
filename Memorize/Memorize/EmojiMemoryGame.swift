//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Marcos on 13/01/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
  private(set) var theme: Theme.gameTheme = .halloween
  
  
  private static func createMemoryGame() -> MemoryGame<String> {
    let emoji: Theme.gameTheme = .halloween
    return MemoryGame<String>(numberOFPairsOfCards: Int.random(in: 3...emoji.emojiTheme.count)) { pairIndex in
      return emoji.emojiTheme[pairIndex]
    }
  }
  
  // MARK: - Acess to the Model (gets)
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: - Intents(s)
  
  func choose (card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
  
  func resetGame(){
    model = EmojiMemoryGame.createMemoryGame()
  }
  
}
