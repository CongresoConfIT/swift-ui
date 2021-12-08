//
//  NewsPostDetailView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import SwiftUI

struct NewsPostDetailView: View {
    
    @Binding var showPostDetail: Bool
    let post: Post
    let postImageData: Data?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    Button {
                        showPostDetail.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                
                if let postImageData = postImageData,
                   let postImage = UIImage(data: postImageData) {
                    
                    Image(uiImage: postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Text(post.title)
                    .font(.title)
                
                Text(post.content.html2String)
            }
            .padding()
        }
    }
}

struct NewsPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPostDetailView(showPostDetail: .constant(true), post: Post.debug, postImageData: nil)
    }
}
