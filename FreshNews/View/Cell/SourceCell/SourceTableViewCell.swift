//
//  SourceTableViewCell.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 06.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameSorceLabel: UILabel!
    
    @IBOutlet weak var descriptionSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameSorceLabel.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
    
    func loadSource(source: Source) {
        nameSorceLabel.text = source.name
        descriptionSourceLabel.text = source.description
    }
}
