//
//  AddView.swift
//  iexpense
//
//  Created by Daniel Lucena Pires on 05/05/23.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses : Expenses
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationView{
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach (types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value:  $amount, format: .currency (code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Adicionar nova despesa")
            .toolbar {
                Button("Gravar") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
