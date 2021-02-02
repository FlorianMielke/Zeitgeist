# Zeitgeist

<p align="center">
    <img src="https://github.com/FlorianMielke/Zeitgeist/workflows/Swift/badge.svg" alt="GitHub Workflows" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-mac+linux-brightgreen.svg?style=flat" alt="Mac + Linux" />
    <a href="https://twitter.com/florianmielke">
        <img src="https://img.shields.io/badge/twitter-@florianmielke-blue.svg?style=flat" alt="Twitter: @florianmielke" />
    </a>
</p>

Zeitgeist provides some lightweight and swifty classes around `Date`. Somewhat inspired by Ruby on Rails 🤷‍♂️.

## Installation

Zeitgeist is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/florianmielke/zeitgeist.git", from: "0.0.2")
    ],
    ...
)
```

Then import Zeitgeist wherever you’d like to use it:

```swift
import Zeitgeist
```

For more information on how to use the Swift Package Manager, check out [its official documentation](https://swift.org/package-manager).

## Contributions and support

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, [open a Pull Request](https://github.com/FlorianMielke/Zeitgeit/pull/new) — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

—Florian
