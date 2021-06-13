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
        
        self.books = getLocalData()
    }
    func getLocalData() -> [Book] {
        
        //find in bundle
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let books = try decoder.decode([Book].self, from: data)
                return books
            } catch  {
                print(error)
            }
        }catch {
            print(error)
        }
        
        return [Book]()
    }
    
    func updateRating(forId: Int , rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: {$0.id == forId}) {
            books[index].isFavourite.toggle()
        }
    }
    
    func updatePage(forId: Int, page: Int)  {
        if let index = books.firstIndex(where: {$0.id == forId  }) {
            books[index].currentPage = page
        }
    }
    
}

