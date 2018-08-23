# ProceduresNavigator
Test project to download a list of surgical procedures and details for each.

The app is build using an MVVM-C architecture with RxSwift(/Cocoa) used for bindings between view and view model.
Networking is done with `URLSession` abstracted behind a protocol, and models are represented as simple `Decodable` structs.
Kingfisher is used for image caching.

## Setup
Requires Xcode 9.4.1 and Cocoapods 1.5.3

From the commandline run the following command to install CocoaPods:
sudo gem install cocoapods

Then the following to setup workspace for pods:
pod install

Open the ProceduresNavigator.xcworkspace in XCode to load the project.
