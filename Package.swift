// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectWebRedirects",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PerfectWebRedirects",
            targets: ["PerfectWebRedirects"]),
    ],
    dependencies: [
			.package(url: "https://github.com/PerfectlySoft/Perfect-Logger.git", from: "3.0.5")
    ],
    targets: [
        .target(
            name: "PerfectWebRedirects",
            dependencies: ["PerfectLogger"]),
        .testTarget(
            name: "PerfectWebRedirectsTests",
            dependencies: ["PerfectWebRedirects"]),
    ]
)
