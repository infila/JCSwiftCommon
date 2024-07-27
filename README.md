# JCSwiftCommon

[![CI Status](https://img.shields.io/travis/James/JCSwiftCommon.svg?style=flat)](https://travis-ci.org/James/JCSwiftCommon)
[![Version](https://img.shields.io/cocoapods/v/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)
[![License](https://img.shields.io/cocoapods/l/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)
[![Platform](https://img.shields.io/cocoapods/p/JCSwiftCommon.svg?style=flat)](https://cocoapods.org/pods/JCSwiftCommon)

## Introduction

JCFramework contains three frameworks for junior developers. They can help you increase development efficiency and write more standardized, maintainable code.

[JCSwiftCommon](https://github.com/infila/JCSwiftCommon): for extensions, some common function, and a lightweight local storage tool based on file system IO.

[JCSwiftRestful](https://github.com/infila/JCSwiftRestful): for Restful APIs. It helps you focus more on handling object-oriented and structured data. To use this framework, you will have to write code using more standard RESTful semantics, both on iOS and server sides. Otherwise, the automatic serialization and deserialization functions within this framework will not work.

[JCSwiftUIWedgets](https://github.com/infila/JCSwiftRestful): contains some custom components. Since many native SwiftUI methods do not support iOS 13 or 14, I have written some components to support these versions. And all components support "theme mode", which meaning you only need to modify one config, and the appearance will change everywhere.

## Example

**Using JCLocalPersistent to implement storing data function.** For example, the following code stores the Person Object person1 to local: 
```ruby
let person1 = Person(name: "A", age: 18)
person1.save()
```

**Using JCLocalPersistent to load the local data.** For example, the following code loads all the Person data from local storage.
```ruby
let people = [Person].load()
```

In addition, you can also load the Person object by its Id.
```ruby
let newPerson = Person.load(byId: "A")
```

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

**James:** infilachen@gmail.com, [LinkedIn](https://www.linkedin.com/in/jameschen5428)

## License

JCSwiftCommon is available under the MIT license. See the LICENSE file for more info.
