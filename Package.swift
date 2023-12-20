// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseDatabaseHandler",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FirebaseDatabaseHandler",
            targets: ["FirebaseDatabaseHandler"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: Version("10.0.0")))
    ],
    targets: [
        .target(
            name: "FirebaseDatabaseHandler",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FirebaseDatabaseHandlerTests",
            dependencies: ["FirebaseDatabaseHandler"]),
    ]
)
