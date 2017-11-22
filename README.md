[![Build Status](https://travis-ci.org/jaffamonkey/macaca-mocha-electron.svg?branch=master)](https://travis-ci.org/jaffamonkey/macaca-mocha-electron)

# Macaca Samples 

This reposistory contains various samples that demonstrate how to use Macaca to test:

1. native iOS app
2. native android app
3. mobile Safari web app
4. mobile Chrome web app
5. desktop Electron app
6. desktop Chrome web app
7. generate custom report for desktop web app

## Usage

run

``` bash
$ make
```

then select one from the following

``` bash
$ make test-ios               Test sample for iOS
$ make test-android           Test sample for Android
$ make test-ios-safari        Test sample for iOS Safari
$ make test-android-chrome    Test sample for Android Chrome
$ make test-desktop-puppeteer Test sample for Desktop PC
$ make test-desktop-electron  Test sample for Desktop PC
$ make test-desktop-chrome    Test sample for Desktop PC
$ make simple-reporter        Test sample for PC with simple reporter
```

**Keep in mind, you have to open an android emulator if you want to run it against an emulator, before you run 'make test-android'**


You can read `Makefile` to understand the detail of each command

## Source Code of Mobile Apps

The source code of mobile apps used in this example can be found

- [ios-app-bootstrap](//github.com/xudafeng/ios-app-bootstrap)
- [android-app-bootstrap](//github.com/xudafeng/android-app-bootstrap)

## License

The MIT License (MIT)
