//
//  Theme.swift
//  Memorize
//
//  Created by JoÃ£o Marcos on 02/02/21.
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
        return ["ð»","ð","ð·","â¡ï¸","ð§ââï¸"]
      case .candy:
        return ["ð©","ðª","ð«","ð­","ð°"]
      case .person:
        return ["ð¨âð³","ð§","ð®ââï¸","ðµï¸ââï¸","ð©âð«"]
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
