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
           tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
       }
       // MARK: - Table view data source
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.articles.count
       }
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsFeedTableViewCell
           let article = articles[indexPath.row]
           cell.setupView(article: article)
           return cell
       }
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let articleViewController = UIStoryboard.init(name: "Article", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleVc") as! ArticleViewController
           articleViewController.article = articles[indexPath.item]
           self.navigationController?.pushViewController(articleViewController, animated: true)
       }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
