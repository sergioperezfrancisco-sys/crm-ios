// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CRMKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(name: "CRMKit", targets: ["CRMKit"])
    ],
    targets: [
        .target(
            name: "CRMKit",
            path: "Sources/CRMKit"
        ),
        .testTarget(
            name: "CRMKitTests",
            dependencies: ["CRMKit"],
            path: "Tests/CRMKitTests"
        )
    ]
)
