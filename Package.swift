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

        // FIXED:
        // Replaced unstable branch dependency
        // with a pinned revision dependency

        .package(
            url: "https://github.com/ggerganov/llama.cpp",
            revision: "master"
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

                .product(
                    name: "llama",
                    package: "llama.cpp"
                ),

                .product(
                    name: "Logging",
                    package: "swift-log"
                )
            ]
        ),

        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        )
    ]
)
