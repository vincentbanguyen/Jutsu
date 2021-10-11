//
//  JutsuApp.swift
//  Jutsu WatchKit Extension
//
//  Created by Vincent Nguyen on 10/9/21.
//

import SwiftUI

@main
struct JutsuApp: App {
    @StateObject private var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //ContentView()
                AccelerometerView().environmentObject(workoutManager)
            }
        }
    }
}
