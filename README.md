# FSOpenInInstagram [![Cocoa Pod](https://cocoapod-badges.herokuapp.com/p/FSOpenInInstagram/badge.svg)](http://cocoadocs.org/docsets/FSOpenInInstagram/) [![Cocoa Pod](https://cocoapod-badges.herokuapp.com/v/FSOpenInInstagram/badge.svg)](http://cocoadocs.org/docsets/FSOpenInInstagram/) [![License](https://go-shields.herokuapp.com/license-MIT-blue.png)](http://opensource.org/licenses/MIT)

FSOpenInInstagram is a tool for sending pictures with the Instagram iOS App.

## Install
Using [CocoaPods](http://cocoapods.org/):

`pod 'FSOpenInInstagram', '~> 1.0'`

## Usage

Check if Instagram app is installed: 

```objc
if ([FSOpenInInstagram canSendInstagram]) {
	//Instagram app is installed
}
```

Open Instagram app composer:
```objc
[FSOpenInInstagram postImage:<Some UIImage> caption:@"Nice picture"];
```

## System support
iOS 6.0+ is currently supported.

## License

FSOpenInInstagram is available under the MIT license. See the LICENSE file for more info.
