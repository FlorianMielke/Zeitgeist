// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Zeitgeist",
    platforms: [
      .iOS(.v13)
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
            name: "Zeitgeist",
            dependencies: []),
        .testTarget(
            name: "ZeitgeistTests",
            dependencies: ["Zeitgeist"]),
    ],
    swiftLanguageVersions: [.v5]
)
