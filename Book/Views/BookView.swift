//
//  BookView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct BookView: View {
 var book: Book
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 10)
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text(book.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Spacer()
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                }
                Text(book.author)
                    .fontWeight(.light)
                    .font(Font.custom("Italic", size: 18))
                Image(book.image)
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
        
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookView(book: model.books[1])
            
    }
}
