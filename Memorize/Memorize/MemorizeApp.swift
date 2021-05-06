//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Marcos on 12/01/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
          EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
