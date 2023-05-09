//
//  ContentView.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var content: AuthViewModel
    var body: some View {
        Group {
            if content.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
