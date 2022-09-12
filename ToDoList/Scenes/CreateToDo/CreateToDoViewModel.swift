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
    
    //update Data
    // when update data calls the getitems from user defaults should call too
    
    
    //getitems from userdefaults
    func addTodo(item: ToDo) {
    getItemsFromDefaults()
        toDos.append(item)
        addItemsToDefaults()
    }
    
    
    func getItemsFromDefaults() {
        guard let data = UserDefaults.standard.object(forKey: key) else { return  }
        guard let allITems = try? JSONDecoder().decode([ToDo].self, from: data as! Data)  else { return }
        toDos = allITems
    }
    
    //add TO defaults
    func addItemsToDefaults() {
        guard let data = try?  JSONEncoder().encode(toDos) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    
}
