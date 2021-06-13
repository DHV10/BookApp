//
//  ContentView.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: BookModel
   
    var body: some View {
        
        NavigationView {
            ScrollView {
                ForEach(model.books) { book in
                    NavigationLink(
                        destination: BookDetailView(book: book),
                        label: {
                            BookView(book: book)
                                .padding()
                                .foregroundColor(.black)
                        })
                    
                }
                .navigationBarTitle("My Library")
            }
        }
            
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView()
            .environmentObject(BookModel())
           
    }
}
