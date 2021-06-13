//
//  BookApp.swift
//  Book
//
//  Created by DHV on 10/06/2021.
//

import SwiftUI

@main
struct BookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BookModel())
        }
    }
}
