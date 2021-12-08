//
//  ConfIT_TalksApp.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

@main
struct ConfIT_TalksApp: App {
    
    @ObservedObject var appEnvironment = AppEnvironment.shared
    
    private let newsView = NewsConfigurator.configure()

    var body: some Scene {
        WindowGroup {
            TabView {
                SessionsView()
                    .tabItem {
                        Label("Ponencias", systemImage: "list.bullet")
                    }
                    .tag(0)

                MyAgenda()
                    .tabItem {
                        Label("Mi agenda", systemImage: "calendar")
                    }
                    .tag(1)

                newsView
                    .tabItem {
                        Label("Novedades", systemImage: "newspaper")
                    }
                    .tag(2)
                
                ContactView()
                    .tabItem {
                        Label("Contacto", systemImage: "info.circle")
                    }
                    .tag(3)
            }
            .environment(\.colorScheme, .light)
            .environmentObject(appEnvironment)
        }
    }
}
