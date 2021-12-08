//
//  NewsPostConfigurator.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import Foundation

class NewsPostConfigurator {
    static func configure(withPost post: Post) -> NewsPostView {
        let viewModel = NewsPostViewModel(post: post)
        return NewsPostView(viewModel: viewModel)
    }
}
