//
//  Parser.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 03.10.2022.
//

import Foundation

class Parser {
    
    static let shared = Parser()
    
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
        func getPosts(completion: @escaping (Posts?, Error?) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json") else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    var parsePosts = try JSONDecoder().decode(Posts.self, from: data)
                    var postDetailsParseArray = [PostDetails]()
                    for index in 0..<parsePosts.posts.count {
                        guard let url = URL(string: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/" + "\(parsePosts.posts[index].postId)" + ".json") else { return }

                        URLSession.shared.dataTask(with: url) { data, response, error in
                            if let error = error {
                                print(error)
                                return
                            }

                            guard let data = data else { return }

                            DispatchQueue.main.async {
                                do {
                                    let parseDetailedPosts = try JSONDecoder().decode(PostsDetails.self, from: data)
                                    postDetailsParseArray.append(parseDetailedPosts.post)
                                    parsePosts.posts[index].text = parseDetailedPosts.post.text
                                    parsePosts.posts[index].postImage = parseDetailedPosts.post.postImage
                                    completion(parsePosts, error)
                                } catch {
                                    print(error)
                                }
                            }
                        }.resume()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
