//
//  String+Ext.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/31.
//

import Foundation

extension String {
  public init<Subject>(typeName object: Subject) {
    let mirror = Mirror(reflecting: object)
    self.init(reflecting: mirror.subjectType)
  }

  public func lastComponent() -> String {
    if lastIndex(of: ".") == nil {
      return self
    }
    let component = split(separator: ".").last!
    return String(component)
  }

  public static func random(withLength length: UInt) -> String {
    let numberAndChars = "1234567890qwertyuiopasdfghjklzxcvbnm"
    var randomOri = [String]()
    numberAndChars.forEach { randomOri.append(String($0)) }
    var result = ""
    for _ in 0 ..< length {
      result = result + randomOri.randomElement()!
    }
    return result
  }

  public func toDictionary() -> [String: Any]? {
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

  public func doubleValue() -> Double? {
    Double(self)
  }

  func toISO8601Date(_ format: String = "yyyy") -> String {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    let date = formatter.date(from: self)
    return "\(date?.format2String(format) ?? "")"
  }
}
