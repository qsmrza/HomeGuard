//
//  HomeGuardApp.swift
//  HomeGuard
//
//  Created by Mimi Makki on 10/29/25.
//


import SwiftUI

@main
struct HomeGuardApp: App {
    @StateObject private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(appData)
        }
    }
}

