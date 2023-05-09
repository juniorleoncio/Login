//
//  NewPasswordView.swift
//  Login
//
//  Created by junior leoncio on 09/05/23.
//

import SwiftUI

struct NewPasswordView: View {
    @State private var email = ""
    @EnvironmentObject var newPassword: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Esqueceu sua senha?")
                .font(.title)
            
            Text("Digite seu email cadastrado, para cadastrar uma nova senha!")
                .multilineTextAlignment(.center)
            
            TextField("Email cadastrado", text: $email)
                .font(.headline)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            Button {
                Task {
                    try await newPassword.resetPassword(email: email)
                    
                }
                dismiss()
                
            } label: {
                Text("Enviar Instruções")
                    .font(.headline).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding(24)
    }
}


struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
