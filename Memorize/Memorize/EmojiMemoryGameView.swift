//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by João Marcos on 12/01/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame

  var body: some View {
    VStack {
      Grid (viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          withAnimation(.linear(duration: 0.75)){
            viewModel.choose(card: card)
          }
        }
        .padding(5)
      }
      .padding()
      .foregroundColor(viewModel.theme.colorTheme)
      HStack {
        Text("Score: ")
        Button(action: {
          withAnimation(.easeInOut) {
            self.viewModel.resetGame()
          }
        }, label: {
          Text("New Game") // LocalizeString
        })
      }
      
    }
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  @State private var animatedBonusRemaining: Double = 0
  
  private func startBonusTimeAnimation() {
    animatedBonusRemaining = card.bonusRemaining
    withAnimation(.linear(duration: card.bonusRemaining)) {
      animatedBonusRemaining = 0
    }
  }
  
  var body: some View {
    GeometryReader{ geometry in
      if card.isFaceUp || !card.isMatched {
        ZStack {
          Group {
            if card.isConsumingBonusTime {
              Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                .onAppear {
                  self.startBonusTimeAnimation()
                  
                }
            } else {
              Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
            }
          }
          .padding(5).opacity(0.4)
          Text(card.content)
            .font(.system(size: fontSize(for: geometry.size)))
            .rotationEffect(Angle.degrees(card.isMatched ? 360 :0))
            .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
        .cardify(isFaceUp: card.isFaceUp)
        .transition(AnyTransition.scale) //offsetaaindad n

      }
    }
    
    // MARK: - Drawing Constants
  }

  private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.7
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    game.choose(card: game.cards[0])
    return EmojiMemoryGameView(viewModel: game)
  }
}
