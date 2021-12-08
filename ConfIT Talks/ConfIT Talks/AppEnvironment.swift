//
//  AppEnvironment.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation
import Combine

class AppEnvironment: ObservableObject {
    static let shared = AppEnvironment()
    
    private let networkController = NetworkController()
    private var cancellableBag = Set<AnyCancellable>()

    @Published var sessions: [Session] = []
    
    init() {
        networkController.getSessions()
            .map { sessions in sessions.sorted(by: { $0.sessionDate < $1.sessionDate }) }
            .receive(on: DispatchQueue.main)
            .assign(to: \.sessions, on: self)
            .store(in: &cancellableBag)
    }
}
