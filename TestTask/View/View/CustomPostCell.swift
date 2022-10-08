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
    @IBOutlet weak var expandCollapseButton: UIButton!
    
    var post: Post! {
        didSet {
            titleLable?.text = post.title
            previewTextLabel?.text = post.preview_text
            expandCollapseButton.addTarget(self, action: #selector(expandCollapseTextByTouch), for: .touchUpInside)
            likesCountLabel?.text = String(post.likes_count)
            timeShampLabel?.text = {
                let dateFormatter = RelativeDateTimeFormatter()
                dateFormatter.unitsStyle = .full
                let daysAgo = dateFormatter.localizedString(for: Date(timeIntervalSince1970: TimeInterval(post.timeshamp)), relativeTo: Date())
                return daysAgo
            }()
            likeImage.image = UIImage(systemName: "bolt.heart.fill")
        }
    }
    
    @objc func expandCollapseTextByTouch() {
        if previewTextLabel.numberOfLines == 0 {
            expandCollapseButton.setTitle("Expand", for: .normal)
            previewTextLabel.numberOfLines = 2
        } else {
            expandCollapseButton.setTitle("Collapse", for: .normal)
            previewTextLabel.numberOfLines = 0
        }
    }

//    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
//        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
}
