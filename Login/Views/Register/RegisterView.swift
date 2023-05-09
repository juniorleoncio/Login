//
//  RegisterView.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var confirmPassword = ""
    @State private var isPresenting = false
    
    @EnvironmentObject var register: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top, 40)
                .padding(.bottom, 40)
        
            TextField("Nome Completo", text: $fullname)
                .font(.headline)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            TextField("Email", text: $email)
                .font(.headline)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            ZStack(alignment: .trailing) {
                SecureField("Confirme a Senha", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.trailing, 8)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.trailing, 8)
                    }
                }
                    
            }
            
            
            Button {
                    
                Task {
                    if formIsValid {
                        try await register.createUser(email: email, password: password, fullname: fullname)
                    } else {
                        register.showRegisterAlert.toggle()
                    }
                }
            } label: {
                Text("Cadastrar-se")
                    .font(.headline).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 24)
            .alert("Preencha os dados corretamente", isPresented: $register.showRegisterAlert) {
                Button("OK", role: .destructive) { print("Confirmed")}
            }
            
            Spacer()
            
            HStack {
                Text("Já é um membro?")
                
                Button{ isPresenting.toggle()} label: {
                    Text("Log In")
                        .font(.headline).bold()
                }
                .fullScreenCover(isPresented: $isPresenting) {
                    withAnimation(.easeOut) {
                        LoginView()
                    }
                }
            }
        }
        .padding(24)
    }
}

extension RegisterView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
    
    
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(AuthViewModel())
    }
}
