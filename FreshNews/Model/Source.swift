//
//  Source.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 06.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

struct Source: Codable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}
