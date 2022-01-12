//
//  BookViewModel.swift
//  FirebaseStarterSwiftUIApp
//
//  Created by Ahmed Abdirashid on 09/12/2020.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BookViewModel: ObservableObject  {
   @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    func fetchData() {
        
        db.collection("books").addSnapshotListener {
            (QuerySnapshot, Error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            self.books = documents.map {(QueryDocumentSnapshot) -> Book in
                let data  =  QueryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let pages = data["pages"]as? Int ?? 0
                let book = Book(title: title, author: author, numberOfPages: pages )
                return book
            }
        }
    }
}
