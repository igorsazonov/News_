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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleViewController = UIStoryboard.init(name: "Article", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleVc") as! ArticleViewController
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
}

extension UIViewController {
    func callingTheAlertViewController (transmitMessages message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
