//
//  ToDo.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 11.09.2022.
//

import Foundation

class ToDo: Identifiable,Codable {
    var id: String
    var title: String
    var content: String
    var date: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString,title: String,content: String,date: String,isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isCompleted = isCompleted
    }
    
    //func update todo
    func updateToDo(title: String,content: String,date: String) -> ToDo {
        return ToDo(id: self.id ,title: title, content: content, date: date)
    }
    //func updatecompletion
    
    func upDateCompletion() -> ToDo{
        return ToDo(id: self.id,title: self.title, content: self.content, date: self.date,isCompleted: !self.isCompleted)
        
    }
    
    
    
    
}
