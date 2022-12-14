//
//  CreateToDoViewModel.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 12.09.2022.
//

import Foundation

class CreateToDoViewModel {
    
    private var toDos = [ToDo]()
    
    private let key = Constants.userDefautsToDosKey
    
    init() {
        getItemsFromDefaults()
    }
 
 
    
    func addTodo(item: ToDo) {
        toDos.append(item)
        addItemsToDefaults()
    }
    
    
    func getItemsFromDefaults() {
        guard let data = UserDefaults.standard.object(forKey: key) else { return  }
        guard let allITems = try? JSONDecoder().decode([ToDo].self, from: data as! Data)  else { return }
        toDos = allITems
    }
    
    
    func addItemsToDefaults() {
        guard let data = try?  JSONEncoder().encode(toDos) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    
}
