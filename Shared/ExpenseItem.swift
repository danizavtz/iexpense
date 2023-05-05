//
//  ExpenseItem.swift
//  iexpense
//
//  Created by Daniel Lucena Pires on 05/05/23.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name :String
    let type: String
    let amount: Double
}
