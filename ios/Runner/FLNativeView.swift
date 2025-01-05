import Foundation
import Flutter
import UIKit
import SwiftUI

struct PostView: View {
    let userName: String
    let profileImage: String
    let postText: String
    @State  var isLiked: Bool = false
    @State  var likeCount: Int = 0
    @State  var view: Int = 0

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
            .padding(.horizontal)
            .padding(.top, 8)

            Text(postText)
                .font(.body)
                .padding(.horizontal)

            HStack {
                Text("\(likeCount) like")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)

                Spacer()

                Text("\(view) view")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            .padding(.top, 5)

            HStack {
                Button(action: {
                    isLiked.toggle()
                    likeCount += isLiked ? 1 : -1
                }) {
                    HStack {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .gray)
                        Text(isLiked ? "Liked" : "Like")
                            .foregroundColor(isLiked ? .red : .gray)
                    }
                    .frame(maxWidth: .infinity)
                }

                Button(action: {
                   
                }) {
                    HStack {
                        Image(systemName: "message")
                            .foregroundColor(.gray)
                        Text("Comment")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }

                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.gray)
                        Text("Share")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 10)
            .font(.subheadline)

            Divider()
                .background(Color.gray)
                .padding(.horizontal)
        }
        .background(Color.white)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

struct PostsView: View {
    var posts: [PostModel]

    var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(posts, id: \.id) { post in
                        PostView(
                            userName: post.userName,
                            profileImage: post.profileImage,
                            postText: post.postText,
                            likeCount: post.likesCount,
                            view: post.views
                
                        )
                    }
                }
            }
    }
}

struct PostModel {
    var id: UUID = UUID()
    var userName: String
    var profileImage: String
    var postText: String
    var likesCount: Int
    var views: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(posts: [
            PostModel(
                userName: "Alice",
                profileImage: "person.fill",
                postText: "This is Alice's post!",
                likesCount: 10,
                views: 20
            ),
            PostModel(
                userName: "Alice",
                profileImage: "person.fill",
                postText: "This is Alice's post!",
                likesCount: 10,
                views: 20
            ),
            PostModel(
                userName: "Alice",
                profileImage: "person.fill",
                postText: "This is Alice's post!",
                likesCount: 10,
                views: 20
            )
        ])
    }
}
