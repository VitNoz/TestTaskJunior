//
//  FavoriteArticleListViewModelDelegate.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 09.02.2023.
//

import Foundation

/// protocol for delegate(first func) and send data(second) from viewmodel to vc
protocol FavoritesListViewModelDelegate: AnyObject {
    func didLoadArticles()
    func didSelectArticle(article: FavoriteArticle)
}
