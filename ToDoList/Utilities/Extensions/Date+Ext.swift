//
//  Date+Ext.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 13.09.2022.
//

import Foundation

extension Date {
    
    func getDateAndTimeAsString() -> String {
        DateFormatter.dateAndTime.string(from: self)
    }
}
