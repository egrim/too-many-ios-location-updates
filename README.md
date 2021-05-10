# too-many-ios-location-updates
A barebones Xcode project demonstrating unwanted location updates in iOS SDK 14.5

This project includes steps to show how an app can request a single location update with [`CLLocationManager.requestLocation()`](https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation) but receive updates indefinitely in the background.  See the in-app instructions for the [steps necessary](https://github.com/egrim/too-many-ios-location-updates/blob/main/TooMany/ContentView.swift#L11) to reproduce this bug.

<img src="https://user-images.githubusercontent.com/401011/117745796-d2083800-b1d0-11eb-8053-dec90c4df3e1.png" alt="app screenshot" width="400"/>


Testing of this project found the unwanted additional location updates as follows:
| Xcode | iOS  | Unwanted Location Updates |
|-------|------|---------------------------|
| 11.6  | 13.7 | No                        |
| 12.4  | 13.7 | No                        |
| 12.4  | 14.4 | Yes                       |
| 12.5  | 14.5 | Yes                       |

When triggered, location updates continue in the background without stopping:

![unwanted background location updates](https://user-images.githubusercontent.com/401011/117746286-ca955e80-b1d1-11eb-9f13-427481e4124a.gif)
