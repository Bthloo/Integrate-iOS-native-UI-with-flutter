////
////  FLNativeView.swift
////  Runner
////
////  Created by Bthloo on 04/01/2025.
////
//
import Foundation
import Flutter
import UIKit
import SwiftUI


struct PostView: View {
    let userName: String
    let profileImage: String
    let postText: String
    @State private var isLiked: Bool = false
    @State private var likeCount: Int = 0
    @State private var commentsCount: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
           
            HStack {
                Image(systemName: profileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.trailing, 8)
                
                Text(userName)
                    .font(.headline)
                
                Spacer()
            }
            .padding()
            
           
            Text(postText)
                .font(.body)
                .padding([.leading, .trailing])
            
                     
            HStack{
                Text("\(likeCount) likes").font(.system(size: 12)).foregroundColor(.gray)
                Spacer()
                Text("\(commentsCount) comments").font(.system(size: 12)).foregroundColor(.gray)
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5))
            
            HStack {
                Button(action: {
                    isLiked.toggle()
                }) {
                    HStack {
                        Image(systemName: isLiked ? "heart.fill" : "heart").foregroundColor(isLiked ? .red : .gray)
                        Text(isLiked ? "Liked" : "Like").foregroundColor(isLiked ? .red : .gray)
                                       }
                    .frame(maxWidth: .infinity)
                }
                
                Button(action: {
                
                }) {
                    HStack {
                        Image(systemName: "message").foregroundColor(.gray)
                        Text("Comment").foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                
                Button(action: {
                   
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up").foregroundColor(.gray)
                        Text("Share").foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
               
            }.padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
            .font(.subheadline)
            Divider()
            .background(Color.gray)
            .padding([.leading, .trailing])
        }
        .background(Color.white)
    }
}
struct PostsView: View {
    var posts: [PostModel]
    
    var body: some View {
        ScrollView {
            ForEach(posts, id: \.id) { post in
                PostView(
                    userName: post.userName,
                    profileImage: post.profileImage,
                    postText: post.postText
                )
            }
        }
    }
}

struct PostModel {
    var id: UUID = UUID()
    var userName: String
    var profileImage: String
    var postText: String
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(
            userName: "Name",
            profileImage: "person.fill",
            postText: "jhj"
        )
    }
}
