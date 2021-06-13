//
//  BookDetailView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var model: BookModel
    @State private var rate = 1
   @State private var isF = false
    var book: Book
    var body: some View {
       
        VStack(alignment: .center) {
            Spacer()
            Text("READ NOW")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
          
        NavigationLink(
            destination: PageDetailView(book: book),
            label: {
 
                        Image(book.image)
                            .resizable()
                            .frame(width: 300, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped().cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 8)
                   
                  
                
            })
            .navigationTitle(book.title)
            Spacer()
            Text("Mark rate later!").foregroundColor(.black)
//            Button(action: {
//                model.updateFavourite(forId: book.id)})
//            {
//                Image(systemName: book.isFavourite ? "star" : "book")
//                    .resizable()
//                    .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            }
//            .accentColor(.yellow)
//
            Button(action: { model.updateFavourite(forId: book.id) }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
           
            Spacer()
            Picker(selection: $rate, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                ForEach(1..<6) { index in
                    Text(String(index)).tag(index)
                }
            })
            
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(book: model.books[5])
    }
}
