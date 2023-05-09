//
//  LoginView.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPresenting = false
    @State private var showResetPassword = false
    
    @EnvironmentObject var login: AuthViewModel
    
    var body: some View {
        VStack {
            
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top, 40)
        
            Spacer()
            TextField("Email", text: $email)
                .font(.headline)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            VStack(spacing: 24) {
                HStack {
                    
                    Spacer()
                    
                    // Esqueci a senha
                    Button { showResetPassword.toggle()} label: {
                        Text("Esqueci a senha")
                            .font(.subheadline)
                            
                    }
                    .sheet(isPresented: $showResetPassword) {
                        withAnimation(.easeIn) {
                            NewPasswordView()
                                .presentationDetents([.fraction(0.5)])
                        }
                    }
                }
                
                // login Firebase padrão 
                Button {
                    Task {
                        if formIsValid {
                            try await login.signIn(email: email, password: password)
                        } else {
                            login.showLoginAlert.toggle()
                        }
                        
                    }
                } label: {
                    Text("Log In")
                        .font(.headline).bold()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .alert("Verifique seu email e senha", isPresented: $login.showLoginAlert) {
                    Button("OK", role: .destructive) { print("Confirmed")}
                }
                
                
            }
            
            Spacer()
            
            HStack {
                Text("Ainda não é membro?")
                
                Button{ isPresenting.toggle()} label: {
                    Text("Cadastre-se")
                        .font(.headline).bold()
                }
                .fullScreenCover(isPresented: $isPresenting) {
                    withAnimation(.easeIn) {
                        RegisterView()
                    }
                }
            }
        }
        .padding(24)
        .onAppear {
            Task {
                 login.fetchUser
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}

