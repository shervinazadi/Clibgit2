// swift-tools-version:5.9
// Clibgit2 — libgit2 1.9.7 as a static xcframework for iOS, the iOS simulator and
// macOS, vending the module `Clibgit2` (umbrella header `git2.h`). Built with the
// system TLS (SecureTransport), the bundled zlib and the system iconv; no SSH, no
// OpenSSL. See README.md for how the binary was built.
import PackageDescription

let package = Package(
    name: "Clibgit2",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "Clibgit2", targets: ["Clibgit2"]),
    ],
    targets: [
        .binaryTarget(
            name: "Clibgit2",
            url: "https://github.com/shervinazadi/Clibgit2/releases/download/v1.9.7-1/Clibgit2.xcframework.zip",
            checksum: "f9ad363936259c8025e6f81dfa13f220f18e6f66d0e8e93145a653dfc7ac1e57"
        ),
    ]
)
