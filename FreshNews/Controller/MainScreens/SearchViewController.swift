//
//  SearchViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 06.06.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    var articles: [Article] = []
    let servicesNews = ServicesNews()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.separatorStyle = .none
        definesPresentationContext = true
        loadFeedSearch("")
    }
    
    // MARK: - Search
    
    func loadFeedSearch(_ searchArticle: String) {
        servicesNews.loadNews(categoryNews: "", searchArticle: searchArticle, completionHandler: { (articles) in
            self.articles = articles
            self.tableView.reloadData()
       }, errorHandler: { (error) in
          self.callingTheAlertViewController(transmitMessages: error.localizedDescription)
       })
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        loadFeedSearch(searchBar.text ?? "")
        tableView.reloadData()
    }
}
