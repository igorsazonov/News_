//
//  EntertainViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 04.06.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class EntertainViewController: UITableViewController {
    var articles: [Article] = []
    let servicesNews = ServicesNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesNews.loadNews(categoryNews: "entertainment", searchArticle: "", completionHandler: { (articles) in
            self.articles = articles
            self.tableView.reloadData()
           }, errorHandler: { (error) in
               self.callingTheAlertViewController(transmitMessages: error.localizedDescription)
           })
           tableView.separatorStyle = .none
           tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
       }
    
       // MARK: - Table view data source
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.articles.count
       }
    
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! NewsFeedTableViewCell
           let article = articles[indexPath.row]
           cell.setupView(article: article)
           return cell
       }
    
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let articleViewController = UIStoryboard.init(name: "Article", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleVc") as! ArticleViewController
           articleViewController.article = articles[indexPath.item]
           self.navigationController?.pushViewController(articleViewController, animated: true)
       }
}
