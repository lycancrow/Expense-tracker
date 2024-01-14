//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-08.
//

import Foundation
import CoreData

class TransactionListViewModel: ObservableObject {
    
    @Published var transactionsListElements: [ExpenseTracker] = []
    @Published var searchText: String = ""
    
    
    var filteredTransactions: [ExpenseTracker] {
        if searchText.isEmpty {
            return transactionsListElements
        } else {
            return transactionsListElements.filter { $0.transactionName?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
    
    
    
    func getAllTransactions() {
        transactionsListElements = ExpenseTrackerModel.shared.getAllTransactions()
        print("Número de elementos en la lista: \(transactionsListElements.count)")
    }

    func deleteTransactionElement(task: ExpenseTracker) {
          ExpenseTrackerModel.shared.viewContext.delete(task)
          ExpenseTrackerModel.shared.saveDataExpense()
          getAllTransactions() 
      }
    
    
    func getTotalAmount() -> Double {
         let total = transactionsListElements.reduce(0.0) { $0 + $1.amount }
         return total
     }
    
    
    
    func totalAmountFiltered() -> Double {
        var totalDailyTransactions : Double = 0
        for personalDailyTotal1 in filteredTransactions {
            totalDailyTransactions += personalDailyTotal1.amount
        }
        print("\(totalDailyTransactions)")
        return totalDailyTransactions
    }
    
}
