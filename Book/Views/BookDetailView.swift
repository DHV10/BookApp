//
//  BookDetailView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var model: BookModel
    @State private var rating = 2
    var book: Book
    @State private var isF = false
    
    var body: some View {
//
//        VStack(alignment: .center) {
//            Spacer()
//            Text("READ NOW")
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//
//
//        NavigationLink(
//            destination: PageDetailView(book: book),
//            label: {
//
//                        Image("cover\(book.id)")
//                            .resizable()
//                            .frame(width: 300, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .clipped().cornerRadius(15)
//                            .shadow(color: Color.black.opacity(0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 8)
//
//
//
//            })
////            .navigationTitle(book.title)
//            Spacer()
//            Text("Mark rate later!").foregroundColor(.black)
////            Button {
////
//////                self.isF = book.isFavourite
////                self.isF.toggle()
////
//////                model.updateFavourite(forId: book.id)
//////                print(book.isFavourite)
////            } label: {
////                Image(systemName: self.isF ? "star.fill" : "star")
////                    .resizable()
////                    .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
////            }
//
//
//            .accentColor(.yellow)
////
//            Button(action: { model.updateFavourite(forId: book.id)
//                print(book.isFavourite)
//            }) {
//                Image(systemName: book.isFavourite ? "star.fill" : "star")
//                    .resizable()
//                    .frame(width: 28, height: 28)
//            }
//            .accentColor(.yellow)
//
//            Spacer()
//            Picker(selection: $rate, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
//                ForEach(1..<6) { index in
//                    Text(String(index)).tag(index)
//                }
//            })
//
//            .pickerStyle(SegmentedPickerStyle())
//            .onChange(of: rate, perform: { value in
//                model.updateRating(forId: book.id, rating: rate)
//            })
//            Spacer()
//
//        }
//        .onAppear { rate = book.rating }
        
        VStack(spacing: 20) {
            NavigationLink(destination: PageDetailView(book: book)) {
                VStack {
                    Text("Read Now!")
                        .font(.title)
                        .accentColor(.black)
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()                }
            }
            .padding()
            
            Text("Mark for later!")
                .font(.headline)
            
            Button(action: { model.updateFavourite(forId: book.id)
                print(book.isFavourite)
            }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
            
            Spacer()
            
            Text("Rate \(book.title)")
                .font(.headline)
            
            Picker("Rate this book!", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)")
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
            
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
  
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(book: model.books[5])
    }
}
