//
//  JCLocalPersistent.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2024-07-05.
//

import Foundation

public final class JCLocalPersistent {
  public static let shared = JCLocalPersistent()

  public var baseDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "/var/document"
  public var encryptClosure: ((Data) -> (Data))?
  public var decryptClosure: ((Data) -> (Data))?

  @discardableResult
  public func saveData(_ data: Data, toFile fileName: String) -> Bool {
    var data = data
    if let encryptClosure = encryptClosure {
      data = encryptClosure(data)
    }
    let url = URL(fileURLWithPath: exactlyFilePath(forName: fileName))
    let folderUrl = url.deletingLastPathComponent()
    var result = false
    Thread.synchronized(self) {
      if !fileManager.fileExists(atPath: folderUrl.absoluteString) {
        try? fileManager.createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil)
      }
      do {
        try data.write(to: url, options: .atomicWrite)
        result = true
      } catch {
        assert(false, "\(error)")
        result = false
      }
    }
    return result
  }

  public func loadData(fromFile fileName: String) -> Data? {
    if !isFileExist(fileName) {
      return nil
    }
    var data: Data?
    Thread.synchronized(self) {
      data = fileManager.contents(atPath: exactlyFilePath(forName: fileName))
    }
    if let decryptClosure = decryptClosure, data != nil {
      data = decryptClosure(data!)
    }
    return data
  }

  public func isFileExist(_ fileName: String) -> Bool {
    return fileManager.fileExists(atPath: exactlyFilePath(forName: fileName))
  }

  public func allFileName(inFolder folderName: String) -> [String] {
    var result: [String]?
    if fileManager.fileExists(atPath: exactlyFilePath(forName: folderName)) {
      result = try? fileManager.contentsOfDirectory(atPath: exactlyFilePath(forName: folderName))
    }
    return result ?? []
  }

  public func remove(_ fileName: String) {
    if !fileManager.fileExists(atPath: exactlyFilePath(forName: fileName)) {
      return
    }
    Thread.synchronized(self) {
      do {
        try fileManager.removeItem(atPath: exactlyFilePath(forName: fileName))
      } catch {
        assert(false, "\(error)")
      }
    }
  }

  private init() { }
  private let fileManager = FileManager()
}

private extension JCLocalPersistent {
  private func exactlyFilePath(forName fileName: String) -> String {
    if fileName.hasPrefix("/") {
      return fileName
    }
    return baseDirectory + "/" + fileName
  }
}

public protocol JCPersistentObject: Codable {
  static var filePath: String? { get }
  static func load(byId id: String) -> Self?
  static func clear()

  var id: String { get }
  func save() -> Bool
}

public extension JCPersistentObject {
  static var filePath: String? {
    return String(typeName: Self.self)
  }

  @discardableResult
  func save() -> Bool {
    var result: Array<Self> = []
    if let oldData = JCLocalPersistent.shared.loadData(fromFile: Self.filePath ?? String(typeName: self)) {
      result = JCSerialization.decode(from: oldData, decodeType: Array<Self>.self) ?? []
    }
    let ids = result.map { $0.id }
    if let index = ids.firstIndex(of: id) {
      result[index] = self
    } else {
      result.append(self)
    }
    return result.save()
  }

  static func load(byId id: String) -> Self? {
    var result: Array<Self> = []
    result.load()
    return result.filter({ $0.id == id }).first
  }

  static func clear() {
    JCLocalPersistent.shared.remove(Self.filePath ?? String(typeName: self))
  }
}

public extension Array where Element: JCPersistentObject {
  @discardableResult
  func save() -> Bool {
    guard let data = JCSerialization.encode(self) else {
      return false
    }
    return JCLocalPersistent.shared.saveData(data, toFile: Element.filePath ?? String(typeName: self))
  }

  mutating func load() {
    if let oldData = JCLocalPersistent.shared.loadData(fromFile: Element.filePath ?? String(typeName: self)) {
      self = JCSerialization.decode(from: oldData, decodeType: Array<Element>.self) ?? [Element]()
    } else {
      removeAll()
    }
  }
}
