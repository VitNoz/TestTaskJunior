//
//  Post.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 03.10.2022.
//

import Foundation

struct Post: Decodable {
    let postId: Int
    let timeshamp: Int
    let title: String
    var text: String?
    var postImage: String?
    let preview_text: String
    let likes_count: Int
}

struct PostDetails: Decodable {
    let postId: Int?
    let timeshamp: Int?
    let title: String?
    let text: String
    let postImage: String
    let likes_count: Int?
}

struct PostsDetails: Decodable {
    let post: PostDetails
}

struct Posts: Decodable {
    var posts: [Post]
}
