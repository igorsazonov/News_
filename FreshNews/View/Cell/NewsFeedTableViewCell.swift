//
//  NewsFeedTableViewCell.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 03.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit
import Kingfisher

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupView(article: Article) {
        let notImage = "https://cdn.freelance.ru/img/portfolio/pics/00/39/04/3736676.jpg?mt=cb1c2bed"
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        let url = URL(string: article.urlToImage ?? notImage)
        articleImage.kf.setImage(with: url)
    }
}
