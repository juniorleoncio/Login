//
//  LoginApp.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI
import Firebase

@main
struct LoginApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                
        }
    }
}
