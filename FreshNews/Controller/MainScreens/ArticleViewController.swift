//
//  ArticleViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 03.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleViewController: UIViewController {
    var article: Article?
    let urlNotImage = "https://cdn.freelance.ru/img/portfolio/pics/00/39/04/3736676.jpg?mt=cb1c2bed" //?
   // var description: String?
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var articleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: article?.urlToImage ?? urlNotImage)
        articleImage.kf.setImage(with: url)
        articleView.layer.cornerRadius = 30
        articleImage.layer.cornerRadius = 5
        titleLabel.text = article?.title ?? "News"
        descriptionLabel.text = article?.description ?? ""
        contentTextView.text = article?.content ?? ""
    }
}
