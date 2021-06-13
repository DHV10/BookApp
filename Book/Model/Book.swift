//
//  Book.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import Foundation

class Book: Identifiable, Decodable {
    var id = 1
//    var image = "cover1"
    var title = "Title"
    var author = "Author"
    var content = ["I am a test book."]
    var isFavourite = false
    var rating = 2
    var currentPage = 0
    
}
