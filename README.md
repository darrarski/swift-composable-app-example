# Swift Composable App Example

![swift: v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform: iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target: iOS 14](https://img.shields.io/badge/deployment%20target-iOS%2014-blueviolet)

## 📝 Description

_TBD_

## 🛠 Tech Stack

- [Xcode](https://developer.apple.com/xcode/) 12.4
- [Swift](https://swift.org/) 5.3

### 🧰 Frameworks 

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- [ComposableArchitecture](http://github.com/pointfreeco/swift-composable-architecture/)
- [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing)

## 🏛 Architecture

The following diagram explains how the project is structured:

```
+---------------+               +--------------+       +---------------+
|      App      +<--------------+    Common    +<--+---+   Library A   |
+----+-----+----+               +---+---+---+--+   |   +---------------+
     ^     ^                        |   |   |      |
     |     |    +---------------+   |   |   |      |   +---------------+
     |     +----+   Feature A   +<--+   |   |      +---+   Library B   |
     |          +---------------+       |   |      |   +---------------+
     |                                  |   |      |
     |          +---------------+       |   |      |   +---------------+
     +----------+   Feature B   +<------+   |      +---+   Library C   |
                +---------------+           |          +---------------+
                       ^                    |    
                       |                    |
                +---------------+           |
                +   Feature C   +<----------+
                +---------------+
```

- **App** - Main application target
- **Feature** - Application Feature library
- **Common** - A library containing common logic and linked external dependencies
- **Library** - External dependencies (static libraries)
- **A ← B** - Module A requires module B

_TBD_

## 🧪 Tests

_TBD_

## ☕️ Do you like the project?

<a href="https://www.buymeacoffee.com/darrarski" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="60" width="217" style="height: 60px !important;width: 217px !important;" ></a>

## 📄 License

Copyright © 2021 [Dariusz Rybicki Darrarski](http://darrarski.pl)

License: [MIT](LICENSE)
