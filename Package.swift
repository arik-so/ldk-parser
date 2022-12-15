// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.112"
let checksum = "87659fac01dc55678f65a2d3ab9a262ac1a070baee350167fe8bd746f73f870e"
let url = "https://github.com/lightningdevkit/ldk-swift/releases/download/\(tag)/LightningDevKit.xcframework.zip"

let package = Package(
    name: "LightningDevKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "LightningDevKit",
            targets: ["LightningDevKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LightningDevKit",
            url: url,
            checksum: checksum
        )
    ]
)
