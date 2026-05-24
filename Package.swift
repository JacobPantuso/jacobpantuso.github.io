// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Portfolio",
    platforms: [.macOS(.v15)],
    dependencies: [
        .package(
            url: "https://github.com/raptor-build/raptor.git",
            from: "0.1.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "Portfolio",
            dependencies: [
                .product(name: "Raptor", package: "Raptor")
            ],
            // Can be removed for single-language sites
            resources: [.process("Resources")]
        )
    ]
)
