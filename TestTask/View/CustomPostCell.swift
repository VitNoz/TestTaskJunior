//
//  CustomPostCell.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 03.10.2022.
//

import UIKit

class CustomPostCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var timeShampLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
    var post: Post! {
        didSet {
            titleLable?.text = post.title
            previewTextLabel?.text = post.preview_text
            likesCountLabel?.text = String(post.likes_count)
            timeShampLabel?.text = {
                let dateFormatter = RelativeDateTimeFormatter()
                dateFormatter.unitsStyle = .full
                dateFormatter.locale = Locale(identifier: "en_US")
                let daysAgo = dateFormatter.localizedString(for: Date(timeIntervalSince1970: TimeInterval(post.timeshamp)), relativeTo: Date())
                return daysAgo
            }()
            likeImage.image = UIImage(systemName: "bolt.heart.fill")
        }
    }
}
