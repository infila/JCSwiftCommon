//
//  Array+Ext.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/31.
//

import Foundation

extension Array where Element: Equatable {
  public mutating func remove(_ element: Element) {
    if let index = firstIndex(of: element) {
      remove(at: index)
    }
  }

  public var unique: [Element] {
    var uniqueValues: [Element] = []
    forEach { item in
      if !uniqueValues.contains(item) {
        uniqueValues.append(item)
      }
    }
    return uniqueValues
  }
}
