//
//  Cardify.swift
//  Memorize
//
//  Created by João Marcos on 26/01/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
  var rotation: Double
  
  var isFaceUp: Bool {
    rotation < 90
  }
  
  var animatableData: Double {
    get { return rotation }
    set { rotation = newValue}
  }
  
  init(isFaceUp: Bool) {
    rotation = isFaceUp ? 0 : 180
  }
  
  func body(content: Content) -> some View{
    ZStack{
      Group {
        RoundedRectangle(cornerRadius: conerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: conerRadius).stroke(lineWidth: edgeLineWidth)
        content
      } .opacity(isFaceUp ? 1 : 0)
      RoundedRectangle(cornerRadius: conerRadius).fill()
        .opacity(isFaceUp ? 0 : 1)
    }
    .rotation3DEffect(
      Angle.degrees(rotation),
      axis: (0,1,0)
      )
  }
  
  private let conerRadius: CGFloat = 10
  private let edgeLineWidth: CGFloat = 3
}

extension View {
  func cardify (isFaceUp: Bool) -> some View {
    self.modifier(Cardify(isFaceUp: isFaceUp))
  }
}
