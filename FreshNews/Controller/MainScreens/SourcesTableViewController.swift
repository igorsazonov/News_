//
//  SourcesTableViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 04.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class SourcesTableViewController: UITableViewController {

    var sources: [Source] = []
    let servicesNews = ServicesNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesNews.loadSourceNews(completionHandler: { (sources) in
            self.sources = sources
            self.tableView.reloadData()
        }, errorHandler: { (error) in
            self.callingTheAlertViewController(transmitMessages: error.localizedDescription)
        })
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as! SourceTableViewCell
        let source = sources[indexPath.row]
        cell.loadSource(source: source)
        return cell
    }
}
