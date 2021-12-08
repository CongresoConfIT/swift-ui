//
//  SessionCardConfigurator.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation

class SessionCardConfigurator {
    static func configure(withSession session: Session) -> SessionCardView {
        let viewModel = SessionCardViewModel(session: session)
        return SessionCardView(viewModel: viewModel)
    }
}
