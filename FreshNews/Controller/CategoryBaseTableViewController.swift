//
//  BaseCategoryTableViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 03.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class CategoryBaseTableViewController: UITableViewController {
    var serviceNews: ServicesNews! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
