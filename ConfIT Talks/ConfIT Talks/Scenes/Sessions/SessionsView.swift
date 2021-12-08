//
//  SessionsView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct SessionsView: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
        
    var body: some View {
        if appEnvironment.sessions.isEmpty {
            LoadingSpinnerView()
        } else {
            SessionsListView(title: "ConfIT Talks", sessions: appEnvironment.sessions)
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
