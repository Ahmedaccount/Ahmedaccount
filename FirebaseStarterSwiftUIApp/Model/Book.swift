//
//  Book.swift
//  FirebaseStarterSwiftUIApp
//
//  Created by Ahmed Abdirashid on 09/12/2020.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Book: Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var author:  String
    var numberOfPages: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case autor
        case numberOfPages = "pages"
    }
}
