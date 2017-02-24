//
//  RepoCell.swift
//  GithubDemo
//
//  Created by LVMBP on 2/23/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class RepoCell: UITableViewCell {

    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoDescLabel: UILabel!
    @IBOutlet weak var repoFolkLabel: UILabel!
    @IBOutlet weak var repoStarLabel: UILabel!
    @IBOutlet weak var repoAuthoLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    var repo: GithubRepo! {
        didSet {
            print("setting value to RepoCell")
            repoImage.setImageWith(repo.ownerAvatarURL!)
            repoDescLabel.text = repo.repoDescription
            repoFolkLabel.text = String(repo.forks!)
            repoStarLabel.text = String(repo.stars!)
            repoAuthoLabel.text = repo.ownerHandle
            repoNameLabel.text = repo.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
