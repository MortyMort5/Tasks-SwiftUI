//
//  Book.swift
//  Tasks SwiftUI
//
//  Created by Sterling Mortensen on 5/19/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Book: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var author: String
    var numberOfPages: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case numberOfPages = "pages"
    }
}
