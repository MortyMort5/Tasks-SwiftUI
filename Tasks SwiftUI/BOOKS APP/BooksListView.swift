//
//  BooksListView.swift
//  Tasks SwiftUI
//
//  Created by Sterling Mortensen on 5/19/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

let testData = [
    Book(title: "Harry Potter", author: "J.K Rollings", numberOfPages: 453),
    Book(title: "Harry Potter 2", author: "J.K Rollings", numberOfPages: 876),
    Book(title: "Harry Potter 3", author: "J.K Rollings", numberOfPages: 234),
    Book(title: "Harry Potter 4", author: "J.K Rollings", numberOfPages: 753)
]


struct BooksListView: View {
    var books = testData
    
    @ObservedObject private var viewModel = BooksViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.books) { book in
                VStack {
                    Text(book.title)
                        .font(.headline)
                    
                    Text(book.author)
                        .font(.subheadline)
                    
                    Text("\(book.numberOfPages) pages")
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Books")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
