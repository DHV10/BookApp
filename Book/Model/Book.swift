//
//  Book.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import Foundation

class Book: Identifiable, Decodable {
    var title: String
    var author: String
    var image:String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var id: Int
    var content:[String]
    
}
