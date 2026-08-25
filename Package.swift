// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "JCSwiftCommon",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "JCSwiftCommon",
      targets: ["JCSwiftCommon"]
    ),
  ],
  targets: [
    .target(
      name: "JCSwiftCommon",
      path: "JCSwiftCommon/Classes"
    ),
  ]
)
