//
//  Theme.swift
//  Memorize
//
//  Created by João Marcos on 02/02/21.
//

import SwiftUI

struct Theme {
  
  enum gameTheme {
    case halloween
    case candy
    case person
    
    var emojiTheme: [String] {
      switch self {
      case .halloween:
        return ["👻","🎃","🕷","⚡️","🧛‍♂️"]
      case .candy:
        return ["🍩","🍪","🍫","🍭","🍰"]
      case .person:
        return ["👨‍🍳","🧕","👮‍♀️","🕵️‍♂️","👩‍🏫"]
      }
    }
    
    var colorTheme: Color {
      switch self {
      case .halloween:
        return .orange
        
      case .candy:
        return .pink
        
      case .person:
        return .yellow
        
      }
    }
    var nameTheme: Text {
      switch self {
      case .halloween:
        return Text("Halloween")
        
      case .candy:
        return Text("Candy")
        
      case .person:
        return Text("Person")
        
      }
    }
    
  }
  func getTheme () -> Int {
    return 0
  }
}
