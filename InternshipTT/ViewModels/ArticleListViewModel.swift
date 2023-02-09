//
//  ArticleListViewModel.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 04.02.2023.
//

import UIKit

class ArticleListViewModel: NSObject {
    
    weak var delegate: ArticleListViewModelDelegate?
    
    ///Array of articles and creating viewmodel for each cell
    var articles: [Article] = [] {
        didSet {
            for article in articles {
                let cellViewModel = ArticleTableViewCellViewModel(articleTitle: article.title!,
                                                                  articlePublishedDate: article.published_date!,
                                                                  articleByline: article.byline!,
                                                                  articleImageUrl: getImageUrl(article: article),
                                                                  articleAbstract: article.abstract!,
                                                                  articleImageData: nil)
                cellViewModels.append(cellViewModel)
            }
        }
    }

    var cellViewModels: [ArticleTableViewCellViewModel] = []
        
        ///get article with request based on article category url
    func getArticles(articlesCategory: ArticleCategory) {

        NetworkManager.shared.getData(urlString: buildUrl(articlesCategory: articlesCategory),
                                      completion: { [weak self] response, error in
            if let response = response {
                self?.articles = response.results!
                DispatchQueue.main.async {
                    self?.delegate?.didLoadArticles()
                }
            }
            if let error = error {
                print("Failed to fetch posts:", error)
                return
            }
        })
    }
        ///create url depends on parameters
    private func buildUrl(articlesCategory: ArticleCategory) -> String {
        
        let baseUrl = "https://api.nytimes.com/svc"
        let apiKey = "qdYU6Xbx838VBSqIrg1vEhSKKxrlVGLz"
        let section = "all-sections"
        let timePeriod = "30"
        
        let apiMostPopular = "/mostpopular/v2/\(articlesCategory.rawValue.lowercased())/\(section)/\(timePeriod).json"
        let url = baseUrl + apiMostPopular + "?api-key=\(apiKey)"
        return url
    }
    
        ///find article image url
    private func getImageUrl(article: Article) -> String? {
        
        guard let imageUrl = article.media?.first?.mediametadata?.first?.url else { return nil }
        return imageUrl
    }
    
}

extension ArticleListViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellId,
                                                            for: indexPath) as! ArticleTableViewCell
        let viewModel = cellViewModels[indexPath.row]
        cell.configureCell(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewModel = cellViewModels[indexPath.row]
        delegate?.didSelectArticle(viewModel: viewModel)
    }
        /// save article to favorites via tableview cell left swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let articleToFavorites = cellViewModels[indexPath.row]
        var articleToFavoritesImageData: Data?
        articleToFavorites.getImage { data, _ in
            articleToFavoritesImageData = data
        }
        let toFavoritesAction = UIContextualAction(style: .normal, title: "to Favorites") { _,_,_ in
            CoreDataManager.shared.saveData(title: articleToFavorites.articleTitle, abstract:articleToFavorites.articleAbstract ,publishedDate: articleToFavorites.articlePublishedDate, byline: articleToFavorites.articleByline, image: articleToFavoritesImageData)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [toFavoritesAction])
        return swipeConfiguration
    }

    
}
