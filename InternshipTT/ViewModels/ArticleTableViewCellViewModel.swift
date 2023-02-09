//
//  ArticleTableViewCellViewModel.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 04.02.2023.
//

import Foundation

class ArticleTableViewCellViewModel {
    
    let articleTitle: String
    let articlePublishedDate: String
    let articleByline: String
    let articleImageUrl: String?
    let articleAbstract: String
    let articleImageData: Data?
    
    init(articleTitle: String, articlePublishedDate: String, articleByline: String, articleImageUrl: String?, articleAbstract: String, articleImageData: Data?) {
        self.articleTitle = articleTitle
        self.articlePublishedDate = articlePublishedDate
        self.articleByline = articleByline
        self.articleImageUrl = articleImageUrl
        self.articleAbstract = articleAbstract
        self.articleImageData = articleImageData
    }

        ///get data for article image
    func getImage(completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = articleImageUrl else { return }

        NetworkManager.shared.getImage(urlString: url, completion: { data, error in
            if let response = data {
                let newData = response
                completion(newData, error)
            }
            if let error = error {
                print("Failed to fetch posts:", error)
                return
            }
        })
    }
}
