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
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
    }*/
    func loadSource(source: Source) {
        nameSorceLabel.text = source.name
        //descriptionSourceLabel.text = source.description
    }
    // setSelected
}
