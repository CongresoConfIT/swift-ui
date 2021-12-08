//
//  NewsConfigurator.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import Foundation

class NewsConfigurator {
    static func configure() -> NewsView {
        let viewModel = NewsViewModel()
        return NewsView(viewModel: viewModel)
    }
}
