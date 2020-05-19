//
//  TaskCellViewModel.swift
//  Tasks Swift
//
//  Created by Sterling Mortensen on 5/18/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables) // Memory Management
        
        $task
            .compactMap { task in
                task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
        $task
            .dropFirst() // ??
            .debounce(for: 0.8, scheduler: RunLoop.main) // Add this so you make sure they are done typeing before making this call so you're not sending up stuff every time they make a change.
            .sink { task in
                self.taskRepository.updateTask(task)
        }
        .store(in: &cancellables)
    }
}
