//
//  BooksViewModel.swift
//  Tasks SwiftUI
//
//  Created by Sterling Mortensen on 5/19/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    
    func addBook(book: Book) {
        do {
            let _ = try db.collection("books").addDocument(from: book)
        } catch {
            print("error writing to firestore: \(error.localizedDescription)")
        }
    }
    
    func fetchData() {
        db.collection("books").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.books = documents.compactMap { (queryDocumentSnapshot) -> Book? in
                return try? queryDocumentSnapshot.data(as: Book.self)
                
//                let data = queryDocumentSnapshot.data()
//
//                let title = data["title"] as? String ?? ""
//                let author = data["author"] as? String ?? ""
//                let pages = data["pages"] as? Int ?? 0
//
//                return Book(title: title, author: author, numberOfPages: pages)
            }
        }
    }
    
}
