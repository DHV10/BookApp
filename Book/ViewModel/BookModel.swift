//
//  BookModel.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        self.books = getLocalJson()
    }
//    func getLocalData() -> [Book] {
//
//        //find in bundle
//        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
//
//        guard pathString != nil else {
//            return [Book]()
//        }
//
//        let url = URL(fileURLWithPath: pathString!)
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            do {
//                let books = try decoder.decode([Book].self, from: data)
//                return books
//            } catch  {
//                print(error)
//            }
//        }catch {
//            print(error)
//        }
//
//        return [Book]()
//    }
    func getLocalJson(_ fileName: String = "Data", fileExtension: String = "json") -> [Book] {
        
        var books = [Book]()
        
        // Get link to data file
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        guard url != nil else {
            print("Could not retrieve category data: \(fileName).\(fileExtension) not found.")
            return books
        }
            
        do {
            // Decode the data and return it
            let data = try Data(contentsOf: url!)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
            
        } catch {
            print("Error retrieving category data: \(error.localizedDescription)")
        }
        
        return books
    }
//    func updateRating(forId: Int , rating: Int) {
//        if let index = books.firstIndex(where: { $0.id == forId }) {
//            books[index].rating = rating
//        }
//    }
//
//    func updateFavourite(forId: Int) {
//        if let index = books.firstIndex(where: {$0.id == forId}) {
//            books[index].isFavourite.toggle()
//        }
//    }
//
//    func updatePage(forId: Int, page: Int)  {
//        if let index = books.firstIndex(where: {$0.id == forId  }) {
//            books[index].currentPage = page
//        }
//    }
    
    /// Update the specified book's rating. Does nothing if `forId` is invalid.
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    /// Update the specified book's favourite status. Does nothing if `forId` is invalid.
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    /// Update the specified book's current page. Does nothing if `forId` is invalid.
    func updatePage(forId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
}

