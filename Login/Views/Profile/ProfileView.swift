//
//  ProfileView.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var profile: AuthViewModel
    var body: some View {
        if let user = profile.currentUser {
            List {
                Section {
                    HStack {
                        Text("\(user.initials)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray).opacity(0.3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(user.fullname)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text("\(user.email)")
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(Color(.systemGray))
                            .font(.subheadline)
                    }
                }
                
                Section("Account") {
                    Button {profile.signOut()} label: {
                        SettingsView(imageName: "arrow.left.circle.fill",
                                     title: "Sair",
                                     tintColor: Color(.systemRed))
                    }
                    .foregroundColor(.primary)
                    
                    
                    Button {
                        Task {
                            try await profile.deleteUser()
                        }
                    } label: {
                        SettingsView(imageName: "xmark.circle.fill",
                                     title: "Deletar Conta",
                                     tintColor: Color(.systemRed))
                    }
                    .foregroundColor(.primary)
                    
                }
                
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
                .environmentObject(AuthViewModel())
            
    }
}
