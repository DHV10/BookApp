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
        
//        NavigationView {
//            ScrollView {
//                ForEach(model.books) { book in
//                    NavigationLink(
//                        destination: BookDetailView(book: book),
//                        label: {
//                            BookView(book: book)
//                                .padding()
//                                .foregroundColor(.black)
//                        })
//
//                }
//                .navigationBarTitle("My Library")
//            }
//        }
 
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookView(book: book)
                                .padding([.leading, .trailing], 20)
                        }
                        // The NavigationLink is a known workaround for an issue identified in iOS 14.5 where the navigation link pops the view as per these forum threads:
                        // https://developer.apple.com/forums/thread/677333
                        // https://forums.swift.org/t/14-5-beta3-navigationlink-unexpected-pop/45279
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView()
            .environmentObject(BookModel())
           
    }
}
