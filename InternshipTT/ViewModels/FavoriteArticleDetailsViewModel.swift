//
//  FavoriteArticleDetailsViewViewModel.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 08.02.2023.
//

import Foundation

class FavoriteArticleDetailsViewModel {
    
    private let article: FavoriteArticle
    let articleTitle: String
    let articleAbstract: String
    let articleByline: String
    let articlePublishedDate: String
    let articleImageData: Data?
    
    init(article: FavoriteArticle) {
        self.article = article
        articleTitle = article.title!
        articleAbstract = article.abstract!
        articleByline = article.byline!
        articlePublishedDate = article.publishedDate!
        articleImageData = article.image
    }
}
