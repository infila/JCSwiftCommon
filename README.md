# JCSwiftCommon

[![CI Status](https://img.shields.io/travis/James/JCSwiftCommon.svg?style=flat)](https://travis-ci.org/James/JCSwiftCommon)
[![Version](https://img.shields.io/cocoapods/v/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)
[![License](https://img.shields.io/cocoapods/l/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)
[![Platform](https://img.shields.io/cocoapods/p/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)

## Introduction

Here are three frameworks for junior developers. They can help you increase development efficiency and write more standardized, maintainable code.:

[JCSwiftCommon](https://github.com/infila/JCSwiftCommon): for extensions, some common function, and a lightweight local storage tool based on file system IO.

[JCSwiftRestful](https://github.com/infila/JCSwiftRestful): for Restful APIs. It helps you focus more on handling object-oriented and structured data. To use this framework, you will have to write code using more standard RESTful semantics, both on iOS and server sides. Otherwise, the automatic serialization and deserialization functions within this framework will not work.

[JCSwiftUIWedgets](https://github.com/infila/JCSwiftRestful): contains some custom components. Since many native SwiftUI methods do not support iOS 13 or 14, I have written some components to support these versions. And all components support "theme mode", which meaning you only need to modify one config, and the appearance will change everywhere.

## Example

To store objects on disk, you only need to add the **JCPersistentObject** protocol to your class, like:
```ruby
class/struct Person: JCPersistentObject { ... }
```

And when you want to save an instance of Person like: 
```ruby
let person = Person(name: "A", age: 18)
```

You can simply call:
```ruby
person.save()
```
To implement the JCPersistentObject protocol, you need to override the persistentId() -> String method. After that, when the persistentId has not been stored before, save() will actually perform an append(). However, when the same persistentId has already been stored, save() will be equivalent to update().

And when you want all Person in file database, you do like:
```ruby
let people = [Person].load()
Or
let newPerson = Person.load(byId: "James")
```

save(), load() and load(byId: String) is already implemented by default, just enjoy. XD

**This is specifically designed for simple scenarios and small amounts of data. For complex scenarios or data that requires frequent CRUD operations, please use a conventional database like CoreData or Sqlite. Thank you.**

To see more examples or test cases, please go to:
[JCSwiftRestful](https://github.com/infila/JCSwiftRestful)

## Requirements

iOS Deployment Target >= 13.0 

## Installation

JCSwiftCommon is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JCSwiftCommon'
```

## Author

James, infilachen@gmail.com, [LinkedIn](https://www.linkedin.com/in/jameschen5428)

Fanny, fanfan.feng9@gmail.com

## License

JCSwiftCommon is available under the MIT license. See the LICENSE file for more info.
