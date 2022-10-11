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
    
    var postViewModel: PostViewModel! {
        didSet {
            titleLable.text = postViewModel.title
            previewTextLabel.text = postViewModel.previewText
            likesCountLabel.text = String(postViewModel.likesCount)
            timeShampLabel.text = postViewModel.timeSincePost
            likeImage.image = UIImage(systemName: "bolt.heart.fill")
        }
    }
}
