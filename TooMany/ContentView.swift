//
//  ContentView.swift
//  TooMany
//
//  Created by Evan Grim on 5/10/21.
//  Copyright © 2021 Evan Grim. All rights reserved.
//

import SwiftUI

let stepsToReproduce = """
1. configure simulator to receive location updates (e.g. select "Features > Location > Freeway Drive" from the menu)

2. launch fresh install of app and grant "while in use"; note continuous location updates being delivered to app in console output despite only requesting a single location update

3. go to home screen and watch console printouts to wait until location updates stop being delivered to app

4. launch another app

5. go back to home screen, you should be prompted for when-in-use/always location authorization for app

6. if you choose always, location updates will resume to app (as seen in console); if you choose "while is use" relaunch app

7. location updates will resume

8. go back to home screen, location updates will continue (with blue banner/pill indicating location updates in progress)
"""

struct ContentView: View {
    var body: some View {
        ScrollView {
            Text("Unwanted Location Updates Demo")
                .font(.largeTitle)
                .padding(.bottom)
            Text(stepsToReproduce)
        }
        .padding(.all)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
