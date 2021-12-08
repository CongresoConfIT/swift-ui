//
//  NewsView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel: NewsViewModel

    var body: some View {
        if viewModel.posts.isEmpty {
            LoadingSpinnerView()
        } else {
            NavigationView {
                List(viewModel.posts, id: \.id) { post in
                    NewsPostConfigurator.configure(withPost: post)
                }
                .padding()
                .navigationTitle("Novedades")
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsConfigurator.configure()
    }
}
