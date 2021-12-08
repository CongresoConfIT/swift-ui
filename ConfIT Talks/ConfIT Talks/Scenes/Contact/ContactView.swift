//
//  ContactView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import SwiftUI

struct ContactButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .foregroundColor(.black)
            .background(Color("mainGold"))
            .cornerRadius(5)
    }
}

extension Button {
    func contactButtonStyle() -> some View {
        modifier(ContactButtonStyle())
    }
}

struct BlueTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("mainBlue"))
            .font(.title)
            .multilineTextAlignment(.center)
    }
}

extension Text {
    func blueTitleTextStyle() -> some View {
        modifier(BlueTitleTextStyle())
    }
}


struct ContactView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("Para consultas o información general")
                    .blueTitleTextStyle()
                
                Button("info@confit.es") {
                    guard let url = URL(string: "mailto:info@confit.es") else { return }
                    
                    UIApplication.shared.open(url)
                }
                .contactButtonStyle()
                
                Spacer()
                
                Text("Si eres una empresa, o quieres participar como ponente")
                    .blueTitleTextStyle()
                
                Button("contacto@confit.es") {
                    guard let url = URL(string: "mailto:contacto@confit.es") else { return }
                    
                    UIApplication.shared.open(url)
                }
                .contactButtonStyle()
                Spacer()
            }
            .navigationTitle("Contacto")
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
