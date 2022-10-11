//
//  PostViewModel.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 08.10.2022.
//

import Foundation
import UIKit

struct PostViewModel {
    
    let title: String
    let previewText: String
    let text: String
    let likesCount: Int
    let timeshamp: Int
    let timeSincePost: String
    let postDate: String
    let image: UIImage
    
    init(post: Post) {
        self.title = post.title
        self.previewText = post.preview_text
        self.text = post.text ?? ""
        self.likesCount = post.likes_count
        self.timeshamp = post.timeshamp
        self.timeSincePost = {
            let dateFormatter = RelativeDateTimeFormatter()
            dateFormatter.unitsStyle = .full
            dateFormatter.locale = Locale(identifier: "en_US")
            let daysAgo = dateFormatter.localizedString(for: Date(timeIntervalSince1970: TimeInterval(post.timeshamp)), relativeTo: Date())
            return daysAgo
        }()
        self.postDate = {
            let date = Date(timeIntervalSince1970: TimeInterval(post.timeshamp))
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.long
            dateFormatter.locale = Locale(identifier: "en_US")
            let dateText = dateFormatter.string(from: date)
            return dateText
        }()
        self.image = {
            let url = URL(string: post.postImage ?? "https://miro.medium.com/max/1400/1*Wou8vfqvoq4amAFsrnodVg.jpeg") //random image
            let data = try! Data(contentsOf: url!)
            let image = UIImage(data: data)!
            return image
        }()
    }
}
