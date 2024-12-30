// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterLatte",
    products: [
        .library(name: "TreeSitterLatte", targets: ["TreeSitterLatte"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterLatte",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterLatteTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterLatte",
            ],
            path: "bindings/swift/TreeSitterLatteTests"
        )
    ],
    cLanguageStandard: .c11
)
