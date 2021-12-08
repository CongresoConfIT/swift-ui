//
//  NewsPostView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import SwiftUI

struct NewsPostView: View {
    
    @ObservedObject var viewModel: NewsPostViewModel
    @State var showPostDetail = false

    var body: some View {
        VStack(alignment: .leading) {
            if let postImageData = viewModel.postImageData,
               let postImage = UIImage(data: postImageData) {
                
                Image(uiImage: postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(viewModel.post.title)
        }
        .onTapGesture {
            showPostDetail.toggle()
        }
        .fullScreenCover(isPresented: $showPostDetail) {
            NewsPostDetailView(showPostDetail: $showPostDetail,
                               post: viewModel.post,
                               postImageData: viewModel.postImageData)
        }
    }
}

struct NewsPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPostConfigurator.configure(withPost: Post.debug)
    }
}
