//
//  AuthViewModel.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}


@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var showLoginAlert = false
    @Published var showRegisterAlert = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    // cria registro no Firestore Cloud passando email, password e fullname além de codificar o id com Firestore
    func createUser(email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            await fetchUser()
        } catch {
            print("DEBUG: falha ao criar usuario: \(error.localizedDescription)")
        }
    }
    
    // função para fazer login usando email e senha cadastrado 
    func signIn(email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed in sigIn with error\(error.localizedDescription)")
        }
    }
    
  

    
    // Deslogar
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    // deleta usuario do FirebaseAuth e Firestore Cloud
    func deleteUser() async throws {
        guard let uid = userSession?.uid else { return }
        
        do {
            // exclui os dados do Firestore Cloud do usuário
            try await Firestore.firestore().collection("users").document(uid).delete()
            
            // exclui a conta do usuário do Firebase Auth
            try await Auth.auth().currentUser?.delete()
            
            // desloga o usuário após exclusão bem-sucedida
            signOut()
        } catch {
            print("DEBUG: Failed to delete user with error \(error.localizedDescription)")
            throw error
        }
    }
   
    
    // Reseta Senha via instruções de email
    func resetPassword(email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
        } catch {
            print("DEBUG: Failed to reset password with error \(error.localizedDescription)")
            throw error
        }
    }
    
    // Recupera currentUser
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}


