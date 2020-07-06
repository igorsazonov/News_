//
//  Sources.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 06.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

struct Sources: Codable {
    let status: String
    let sources: [Source]
}
