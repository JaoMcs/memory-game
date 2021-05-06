//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by João Marcos on 19/01/21.
//

import Foundation

extension Array where Element: Identifiable {
  func fistIndex(matching: Element) -> Int? {
    
    for index in 0..<self.count{
      if self[index].id == matching.id {
        return index
        
      }
    }
    return nil
  }
}
