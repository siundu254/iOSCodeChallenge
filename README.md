[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# NASA API

## Overview

The project demonstrates Fetching data, parsing model entities from JSON, Use of MVVM-C to build UI and Navigation. The App is purely built on AutoLayout and UIKit. The primary language used is swift.

![UI Screens](https://i.ibb.co/4ttrC6t/Screenshot-2022-07-26-at-05-16-56.png)

### Features

* Home View :
  * Display Loading View on Initial Loading
  * Fetch nasa data asynchronously
  * Update UI accordingly
  * Handle Error States
  * Test View Model to assert data is not nil
* Detail View :
  * Display a detail view of the nasa images info
  * Handle smoooth back navigation

## Requirements

- [x] iOS 13.0+
- [x] Xcode 13.0+

### Built With

Language used when building this project :

- [x] [Swift 5](https://swift.org/blog/swift-5-released/)

### Dependency Management

#### CocoaPods
You have to install Cocoa pods in your machine like so:
```sh
sudo gem install cocoapods
```

To get started, move inside your WeatherApp folder and run
```sh
pod init
```

This creates a Podfile, which will hold all your dependencies in one place. Currently all dependencies are already added to podfile so you can run

```sh
pod install
```

### Project Structure

To keep all those hundreds of source files from ending up in the same directory, we used a folder structure in relation to the architecture used:

    ├─ Coordinator
    ├─ ViewModels
    ├─ Views
    ├─ Controllers
    ├─ Networking Layer
    ├─ Supporting Files
    ├─ Common Files
    
## Architecture
 * [Model-View-ViewModel-Coordinator](MVVM-C)
 * Motivated by "massive view controllers": MVVM considers `UIViewController` subclasses part of the View and keeps them slim by maintaining all state in the ViewModel.
 * To learn more about it, check out Bob Spryn's [fantastic introduction][sprynthesis-mvvm].
 * Coordinators are used to help in easy navigation between view controllers

## Contributions

This section contains an overview of this topic — please refer here for more comprehensive information:

- [iOS Developer Library: Xcode Concepts][apple-xcode-concepts]
- [Samantha Marshall: Managing Xcode][pewpew-managing-xcode]

[apple-xcode-concepts]: https://developer.apple.com/library/ios/featuredarticles/XcodeConcepts/
[pewpew-managing-xcode]: http://pewpewthespells.com/blog/managing_xcode.html
  
<!-- CONTACT -->
## Contact

KEVIN SIUNDU - siundu344@gmail.com

Project Link: [https://github.com/rahmakevo/iOSCodeChallenge](https://github.com/rahmakevo/iOSCodeChallenge)

Distributed under the MIT license. See ``LICENSE`` for more information.


[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics

