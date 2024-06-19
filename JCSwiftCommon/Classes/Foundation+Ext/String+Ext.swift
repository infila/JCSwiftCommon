//
//  String+Ext.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/31.
//

import Foundation

public extension String {
  enum StringRandomStrategy {
    case number
    case chat
    case numberAndChat
  }

  static func random(withLength length: UInt, strategy: StringRandomStrategy) -> String {
    var range: String = ""
    switch strategy {
    case .number:
      range = "1234567890"

    case .chat:
      range = "qwertyuiopasdfghjklzxcvbnm"
    case .numberAndChat:
      range = "1234567890qwertyuiopasdfghjklzxcvbnm"
    }
    var randomOri = [String]()
    range.forEach { randomOri.append(String($0)) }
    var result = ""
    for _ in 0 ..< length {
      result = result + randomOri.randomElement()!
    }
    return result
  }

  init<Subject>(typeName object: Subject) {
    let mirror = Mirror(reflecting: object)
    self.init(reflecting: mirror.subjectType)
  }

  func lastComponent() -> String {
    if lastIndex(of: ".") == nil {
      return self
    }
    let component = split(separator: ".").last!
    return String(component)
  }

  func toDictionary() -> [String: Any]? {
    guard !isEmpty else { return nil }

    guard let dataSelf = data(using: .utf8) else {
      return nil
    }

    if let dic = try? JSONSerialization.jsonObject(with: dataSelf,
                                                   options: .mutableContainers) as? [String: Any] {
      return dic
    }
    return nil
  }

  func doubleValue() -> Double? {
    Double(self)
  }

  func toISO8601Date(_ format: String = "yyyy") -> String {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    let date = formatter.date(from: self)
    return "\(date?.format2String(format) ?? "")"
  }
}
