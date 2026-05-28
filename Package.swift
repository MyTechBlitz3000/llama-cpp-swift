// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LLamaSwift",

    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v4),
        .tvOS(.v14),
        .visionOS(.v1)
    ],

    products: [
        .library(
            name: "LLamaSwift",
            targets: ["LLamaSwift"]
        )
    ],

    dependencies: [

        // ❗ MUST use branch OR tag, not revision placeholder
        .package(
            url: "https://github.com/ggerganov/llama.cpp",
            branch: "master"
        ),

        .package(
            url: "https://github.com/apple/swift-log.git",
            from: "1.6.1"
        )
    ],

    targets: [

        .target(
            name: "LLamaSwift",
            dependencies: [

                // ❗ llama.cpp is NOT a Swift product
                // You must NOT reference it like this unless you added a SwiftPM wrapper
                .product(
                    name: "Logging",
                    package: "swift-log"
                )
            ],

            linkerSettings: [
                // llama.cpp must be linked manually via CMake/Xcode build step
                .linkedLibrary("llama")
            ]
        ),

        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        )
    ]
)
