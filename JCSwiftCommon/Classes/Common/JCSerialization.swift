//
//  JCSerialization.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/18.
//

import Foundation

struct JCSerialization {
  static func decode<T: Decodable>(from data: Data, decodeType: T.Type) -> T? {
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      assert(false, "Couldn't parse \(String(data: data, encoding: .utf8) ?? data.description) as \(T.self):\n\(error)")
    }
    return nil
  }

  static func encode<T: Encodable>(_ value: T) -> Data? {
    do {
      let encoder = JSONEncoder()
      return try encoder.encode(value)
    } catch {
      assert(false, "Couldn't parse \(value) to data:\n\(error)")
    }
    return nil
  }

  static func convertObject<T: Encodable>(_ object: T) -> [String: Any] {
    let mirror = Mirror(reflecting: object)
    let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label: String?, value: Any) -> (String, Any)? in
      guard let label = label else { return nil }
      if let subObject = value as? Codable {
        let subDic = self.convertObject(subObject)
        if !subDic.isEmpty {
          return (label, subDic)
        } else {
          return (label, value)
        }
      } else {
        return (label, value)
      }
    }).compactMap { $0 })
    return dict
  }

  static func isJsonEqual<T: Encodable>(_ obj1: T, _ obj2: T) -> Bool {
    return encode(obj1) == encode(obj2)
  }
}
