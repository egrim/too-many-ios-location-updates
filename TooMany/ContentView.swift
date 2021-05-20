//
//  ContentView.swift
//  TooMany
//
//  Created by Evan Grim on 5/10/21.
//  Copyright © 2021 Evan Grim. All rights reserved.
//

import SwiftUI

let stepsToReproduce: String? = {
    do {
        guard let readmeFileURL = Bundle.main.url(forResource:"README", withExtension: "md") else { return nil }

        let readmeText = try String(contentsOf: readmeFileURL)
        let reproSteps = readmeText.components(separatedBy: "<!-- REPRO_STEPS -->\n")[1]
        return reproSteps
    } catch {
        print("Could not retrieve steps to reproduce from README.md")
        return nil
    }
}()

struct ContentView: View {


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Too Many Location Updates Demo")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: true)
                Text(stepsToReproduce ?? "See README in project for steps to demonstrate receiving unwanted continuous location updates.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.all)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
