//
//  PageDetailView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct PageDetailView: View {
    var book:Book
    var body: some View {
        TabView {
            ForEach(0..<book.content.count ) { index in
                VStack {
                    Text(book.content[index]).tag(index)
                    Spacer()
                    Text("\(index+1)")
                }
               
            }
                
        }
        .tabViewStyle(PageTabViewStyle())
        .padding()
    }
}

struct PageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        PageDetailView(book: model.books[1])
    }
}
