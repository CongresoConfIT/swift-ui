//
//  MyAgenda.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct MyAgenda: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    @AppStorage("sessionsIdsInAgenda") private var sessionsIdsInAgenda: [Int] = []

    private var sessionsInAgenda: [Session] {
        appEnvironment.sessions.filter { sessionsIdsInAgenda.contains($0.id) }
    }
    
    var body: some View {
        if sessionsIdsInAgenda.isEmpty {
            Text("No has añadido ninguna ponencia a tu agenda.")
        } else {
            SessionsListView(title: "Mi agenda", sessions: sessionsInAgenda)
        }
    }
}

struct MyAgenda_Previews: PreviewProvider {
    static var previews: some View {
        MyAgenda()
    }
}
