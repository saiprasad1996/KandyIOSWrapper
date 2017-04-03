## Description
**This project is a library for the IOS which is a wrapper around Kandy REST API for Collaborizm Hackathon.**


## Our Team :
[Sai Prasad](https://github.com/saiprasad1996), [Harsha Alva](https://github.com/aharshac), [Ranjan Dailata](https://github.com/ranjancse26)

### Library dependencies for running this library
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

### Installation
* First install Alamofire to the project (use the link above to get the project files) by dragging the Alamofire.xcodeproj and Source folder to the project navigation
* Then remove test targets by clicking on the Alamofire.xcodeproj in the project navigation of XCode and delete test targets from the targets, then build Alamofire project by selecting Alamofire and target as IOS on the top navigation and click on run button  
* Next copy the SwiftyJSON.swift file from the SwiftyJSON repo (use the link above) to the project navigation
* Finally copy the **KandyLib.swift** file from this project to the project Navigator
* Now you can start using the KandyIOS library in your project to send sms

### Usage
The library has a simple implementation using functional approach. All you need to do is to call the following function shown in the code.

```swift

func sendSMS(domain_api_key:String,domain_secret:String,user_id:String,source:String,destination:String,message:String) -> String {...}

```

The parameter from the above function can be found at the Kandy Developer Account page of your project simply use those string as parameters and you are good to go.

The function returns the JSON response as string(which is done deliberately) and its upon the developer how he/she intends to use the JSON string.

## Demo

### Deploying the library using the KandyLib
![Xcode output with Simulator](https://raw.githubusercontent.com/saiprasad1996/KandyIOSWrapper/master/xcode_ios.png)

### Simulator output
![iPhone Simulator Output](https://github.com/saiprasad1996/KandyIOSWrapper/blob/master/simulator.png)

*TBN : This project is released under MIT license. A copy of the license can be found in the project.*
