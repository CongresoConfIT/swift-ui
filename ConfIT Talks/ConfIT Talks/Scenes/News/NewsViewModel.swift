//
//  NewsViewModel.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import Combine
import SwiftUI

class NewsViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    private let networkController = NetworkController()
    
    private var cancellableBag = Set<AnyCancellable>()

    init() {
        print("[INIT]")
        networkController.getPosts()
            .map { posts in posts.sorted(by: { $0.date < $1.date }) }
            .receive(on: DispatchQueue.main)
            .assign(to: \.posts, on: self)
            .store(in: &cancellableBag)
    }
}
