//
//  TrackerViewModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-08.
//

import Foundation
import CoreData


class AddTransactionViewModel: ObservableObject {
    
    @Published var addTransactionViewModel: [ExpenseTracker] = []
    
    func addTransaction(amount: Double, category: String, incomeOrExpenseVal: Bool, transactionName: String) {
        
        let expenseTracker = ExpenseTracker(context: ExpenseTrackerModel.shared.viewContext)
        expenseTracker.id = UUID()
        expenseTracker.date = Date()
        expenseTracker.amount = amount
        expenseTracker.category = category
        expenseTracker.incomeOrExpense = incomeOrExpenseVal
        expenseTracker.transactionName = transactionName
        
        do {
            try ExpenseTrackerModel.shared.saveDataExpense()
            print("Data saved successfully. WUHU!!!")
            
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Data not saved: \(nsError), \(nsError.userInfo)")
        }
      
    }
    
    
 
    
    
}
