//
//  Array+Only.swift
//  Memorize
//
//  Created by João Marcos on 21/01/21.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
