//
//  TopViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 04.06.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class TopViewController: UITableViewController {
    var articles: [Article] = []
    //var activityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //activityIndicatorView.startAnimating()
        ServicesNews.shared.loadNews(categoryNews: "", searchArticle: "", completionHandler: { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }, errorHandler: { (error) in
            self.callingTheAlertViewController(transmitMessages: error.localizedDescription)
        })
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
        let article = articles[indexPath.row]
        cell.setupView(article: article)
        return cell
    }
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
    }*/
}

extension UIViewController {
    func callingTheAlertViewController (transmitMessages message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
