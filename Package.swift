// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Zeitgeist",
  platforms: [
    .iOS(.v15),
    .watchOS(.v10)
  ],
  products: [
    .library(
      name: "Zeitgeist",
      targets: ["Zeitgeist"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Zeitgeist"),
    .testTarget(
      name: "ZeitgeistTests",
      dependencies: ["Zeitgeist"]),
  ]
)
