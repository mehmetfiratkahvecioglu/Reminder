//
//  DateFormatter+Ext.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 13.09.2022.
//

import Foundation

extension DateFormatter {
    
    static let dateAndTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        return formatter
    }()
}
