//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 11.09.2022.
//

import Foundation

class ToDoListViewModel {
    
    var toDos = [ToDo]()
    
    let key = Constants.userDefautsToDosKey
    
    init() {
        getItemsFromDefaults()
    }
    
    func checkButtonTapped(item: ToDo) {
        if let index = toDos.firstIndex(where: { ToDo in ToDo.id == item.id }) { toDos[index] = item.upDateCompletion() }
        
        addItemsToDefaults()
        
    }
    
    func addItemsToDefaults() {
        guard let data = try?  JSONEncoder().encode(toDos) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func getItemsFromDefaults() {
        guard let data = UserDefaults.standard.object(forKey: key) else { return  }
        guard let allITems = try? JSONDecoder().decode([ToDo].self, from: data as! Data)  else { return }
        toDos = allITems
    }
}
