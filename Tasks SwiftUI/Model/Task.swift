//
//  Task.swift
//  Tasks SwiftUI
//
//  Created by Sterling Mortensen on 4/29/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userID: String?
}

#if DEBUG
let testDataTasks = [
    Task(title: "do the dew", completed: true),
    Task(title: "dogg ah ya", completed: false),
    Task(title: "No way man", completed: true),
    Task(title: "look at that", completed: true),
    Task(title: "just look at that", completed: false)
]
#endif
