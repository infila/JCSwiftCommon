//
//  JCSerialization.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/18.
//

import Foundation

public struct JCSerialization {
  public static func decode<T: Decodable>(from data: Data, decodeType: T.Type) -> T? {
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      assert(false, "Couldn't parse \(String(data: data, encoding: .utf8) ?? data.description) as \(T.self):\n\(error)")
    }
    return nil
  }

  public static func encode<T: Encodable>(_ value: T) -> Data? {
    do {
      let encoder = JSONEncoder()
      return try encoder.encode(value)
    } catch {
      assert(false, "Couldn't parse \(value) to data:\n\(error)")
    }
    return nil
  }

  public static func objectToDict<T: Encodable>(_ object: T) -> [String: Any] {
    let mirror = Mirror(reflecting: object)
    let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label: String?, value: Any) -> (String, Any)? in
      guard let label = label else { return nil }
      if let subObject = value as? Codable {
        let subDic = self.objectToDict(subObject)
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

  public static func jsonString<T: Encodable>(_ instance: T, encoding: String.Encoding = .utf8) -> String? {
    guard let data = encode(instance) else {
      return nil
    }
    return String(data: data, encoding: encoding)
  }

  public static func convertJsonString<T: Decodable>(_ string: String, toInstanceType: T.Type, encoding: String.Encoding = .utf8) -> T? {
    guard let data = string.data(using: encoding) else {
      return nil
    }
    return decode(from: data, decodeType: toInstanceType)
  }

  public static func isJsonEqual<T: Encodable>(_ obj1: T, _ obj2: T) -> Bool {
    return jsonString(obj1) == jsonString(obj2)
  }
}
