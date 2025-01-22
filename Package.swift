// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MulticastDelegate",
    platforms: [
        .iOS(.v17),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MulticastDelegate",
            targets: ["MulticastDelegate"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MulticastDelegate",
            dependencies: []),
    ]
)
