# too-many-ios-location-updates
A barebones Xcode project demonstrating unwanted location updates in iOS

This project shows an apparent regression between iOS versions 13 and 14 where an app can request a single location update with [`CLLocationManager.requestLocation()`](https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation) but receive updates indefinitely in the background.

![unwanted background location updates](https://user-images.githubusercontent.com/401011/117746286-ca955e80-b1d1-11eb-9f13-427481e4124a.gif)

### Steps to reproduce

Here are the steps necessary to reproduce this problem:
1. if using a simulator, configure it to receive location updates (e.g. select "Features > Location > Freeway Drive" from the menu)

2. launch fresh install of app and grant "while in use"; note continuous location updates being delivered to app in console output despite only requesting a single location update (at this point the bug has been triggered, the rest just demonstrates how problematic it is for apps that request background location updates)

3. go to home screen and watch console printouts to wait until location updates stop being delivered to app

4. launch another app

5. go back to home screen, you should be prompted for when-in-use/always location authorization for app

6. if you choose always, location updates will resume to app (as seen in console); if you choose "while is use" relaunch app

7. location updates will resume

8. go back to home screen, location updates will continue (with blue banner/pill indicating location updates in progress)

These instructions are also displayed in the demo app's UI.

<img src="https://user-images.githubusercontent.com/401011/117745796-d2083800-b1d0-11eb-8053-dec90c4df3e1.png" alt="app screenshot" width="400"/>

### Versions Tested

Testing of this project found the unwanted additional location updates as follows:
| Xcode | iOS  | Unwanted Location Updates |
|-------|------|---------------------------|
| 11.6  | 13.7 | No                        |
| 12.4  | 13.7 | No                        |
| 12.4  | 14.4 | Yes                       |
| 12.5  | 14.5 | Yes                       |
