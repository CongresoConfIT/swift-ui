//
//  SessionsListView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct SessionsListView: View {
    
    let title: String
    let sessions: [Session]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(sessions, id: \.id) { session in
                        SessionCardConfigurator.configure(withSession: session)
                    }
                }
                .padding(30)
            }
            .navigationTitle(title)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
