//
//  NewsPostViewModel.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import SwiftUI
import Combine

class NewsPostViewModel: ObservableObject {
    let post: Post
    
    @Published var postImageData: Data?
    
    private let networkController = NetworkController()
    
    private var cancellableBag = Set<AnyCancellable>()

    init(post: Post) {
        self.post = post
        
        if let postImageId = post.featuredMedia {
            networkController.getImageURL(imageId: postImageId)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] imageData in
                    guard let imageData = imageData else {
                        return
                    }

                    withAnimation {
                        self?.postImageData = imageData
                    }
                }
                .store(in: &cancellableBag)
        }        
    }
}
