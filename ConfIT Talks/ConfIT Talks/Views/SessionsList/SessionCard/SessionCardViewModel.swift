//
//  SessionCardViewModel.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Combine
import SwiftUI

class SessionCardViewModel: ObservableObject {
    let session: Session
    
    @Published var firstSpeakerImageData: Data?
    @Published var secondSpeakerImageData: Data?
    
    private let networkController = NetworkController()
    
    private var cancellableBag = Set<AnyCancellable>()

    init(session: Session) {
        self.session = session
        
        if let firstSpeakerImageId = session.firstSpeaker.speakerImage {
            networkController.getImageURL(imageId: firstSpeakerImageId)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] imageData in
                    guard let imageData = imageData else {
                        return
                    }

                    withAnimation {
                        self?.firstSpeakerImageData = imageData
                    }
                }
                .store(in: &cancellableBag)
        }
        
        if let secondSpeakerImageId = session.secondSpeaker.speakerImage {
            networkController.getImageURL(imageId: secondSpeakerImageId)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] imageData in
                    guard let imageData = imageData else {
                        return
                    }

                    withAnimation {
                        self?.secondSpeakerImageData = imageData
                    }
                }
                .store(in: &cancellableBag)
        }
    }
}
