//
//  User.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var fullname: String
    var email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        
        return ""
    }
}

extension User {
    static var MOCK_UP = User(id: UUID().uuidString, fullname: "", email: "")
}
