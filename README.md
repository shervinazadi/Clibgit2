# Clibgit2

[libgit2](https://github.com/libgit2/libgit2) **v1.9.7** as a static
`Clibgit2.xcframework`, packaged for Swift Package Manager.

```swift
.package(url: "https://github.com/shervinazadi/Clibgit2.git", exact: "1.9.7-1"),
// …
.product(name: "Clibgit2", package: "Clibgit2")
```

`import Clibgit2` gives the libgit2 C API (umbrella header `git2.h`, the
`git2/sys` headers as the explicit submodule `Clibgit2.sys`).

## What is in the binary

| | |
|---|---|
| libgit2 | v1.9.7, static (`libgit2.a`) |
| slices | `ios-arm64`, `ios-arm64_x86_64-simulator`, `macos-arm64_x86_64` |
| minimums | iOS 17, macOS 14 |
| HTTPS | the system's SecureTransport (no OpenSSL) |
| SSH | off |
| zlib | bundled into the library |
| iconv | the system's |
| regex, HTTP parser | libgit2's built-in ones |

The module map autolinks `CoreFoundation`, `Security` and `iconv`, so a
consumer links nothing else.

## Provenance

Built on a Mac (Xcode 27.0, CMake 4.4.4) by `swift/scripts/build-clibgit2.sh`
in [shervinazadi/threads_augmentation_system](https://github.com/shervinazadi/threads_augmentation_system),
the repository this package serves: five static CMake builds of the libgit2 tag
(iOS arm64, iOS simulator arm64 and x86_64, macOS arm64 and x86_64), `lipo`
for the two-architecture slices, `xcodebuild -create-xcframework` with the
script's `Clibgit2.modulemap` in each slice. To rebuild:

```
swift/scripts/build-clibgit2.sh v1.9.7
```

The script prints the zip's size and its `swift package compute-checksum`
result; a new release attaches the zip and updates the URL and checksum in
`Package.swift`. Releases are tagged `v<libgit2 version>-<build>`
(this one `v1.9.7-1`, checksum `f9ad363936259c8025e6f81dfa13f220f18e6f66d0e8e93145a653dfc7ac1e57`).

## Licence

libgit2 is under the GPL v2 with a linking exception; see `COPYING`, copied
from the libgit2 tag the binary was built from.
