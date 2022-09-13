//
//  DetailToDoViewModel.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 13.09.2022.
//

import Foundation

class DetailToDoViewModel{
    private var toDos = [ToDo]()
    
    private let key = Constants.userDefautsToDosKey
    
    init() {
        getItemsFromDefaults()
    }
 
    
    
    
    func editTodo(item: ToDo) {
        guard let index = toDos.firstIndex(where: { ToDo in
            ToDo.id == item.id
        }) else { return  }
        
        toDos[index] = item
        
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
