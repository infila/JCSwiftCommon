# JCSwiftCommon

[![Release](https://img.shields.io/github/v/tag/infila/JCSwiftCommon?label=release)](https://github.com/infila/JCSwiftCommon/tags)
![iOS](https://img.shields.io/badge/iOS-13%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.7%2B-orange)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

Common Swift extensions, utility functions, and lightweight file-based persistence.

Related packages: [JCSwiftRestful](https://github.com/infila/JCSwiftRestful) and [JCSwiftUIWidgets](https://github.com/infila/JCSwiftUIWidgets).

## Persistence example

Conform a `Codable` type to `JCPersistentObject` and provide a stable identifier:

```swift
struct Person: JCPersistentObject {
  let id: String
  var name: String
  var age: Int

  func persistentId() -> String { id }
}

let person = Person(id: "james", name: "James", age: 18)
person.save()

let people = [Person].load()
let james = Person.load(byId: "james")
```

This persistence helper is intended for simple scenarios and small amounts of data. For complex models or frequent CRUD operations, use SwiftData, Core Data, or SQLite.

## Requirements

- iOS 13 or later
- Xcode 14 or later

## Installation

### Swift Package Manager

In Xcode, select **File > Add Package Dependencies** and enter:

```text
https://github.com/infila/JCSwiftCommon.git
```

Select version `1.1.0` or later, then:

```swift
import JCSwiftCommon
```

### CocoaPods

CocoaPods Trunk currently contains version `1.0.2`:

```ruby
pod 'JCSwiftCommon', '~> 1.0.2'
```

To use the current Git release:

```ruby
pod 'JCSwiftCommon', :git => 'https://github.com/infila/JCSwiftCommon.git', :tag => '1.1.0'
```

## Authors

James Chen — infilachen@gmail.com — [LinkedIn](https://www.linkedin.com/in/jameschen5428)

Fanny Feng — fanfan.feng9@gmail.com

## License

JCSwiftCommon is available under the MIT license. See [LICENSE](LICENSE).
