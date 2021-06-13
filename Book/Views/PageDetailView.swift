//
//  PageDetailView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct PageDetailView: View {
    @EnvironmentObject var model: BookModel
    @State private var page = 0
    var book:Book
    var body: some View {
//        TabView {
//            ForEach(0..<book.content.count ) { index in
//                VStack {
//                    Text(book.content[index]).tag(index)
//                    Spacer()
//                    Text("\(index+1)")
//                }
//
//            }
//
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .padding()
//        .onChange(of: page, perform: { value in
//            model.updatePage(forId: book.id, page: page)
//        })
//        .onAppear {
//            page = book.currentPage
//        }
        
        TabView(selection: $page) {
            ForEach(book.content.indices) { index in
                VStack(alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear {
            page = book.currentPage
        }
    }
}

struct PageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        PageDetailView(book: model.books[1])
    }
}
