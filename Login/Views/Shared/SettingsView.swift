//
//  SettingsView.swift
//  Login
//
//  Created by junior leoncio on 08/05/23.
//

import SwiftUI

struct SettingsView: View {
    var imageName: String
    var title: String
    var tintColor: Color
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text("\(title)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
    }
}
