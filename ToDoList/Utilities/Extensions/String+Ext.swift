//
//  String+Ext.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 13.09.2022.
//

import Foundation

extension String {
    
    func getDateAndTimeAsDate() -> Date? {
        return DateFormatter.dateAndTime.date(from: self)
    }
}
