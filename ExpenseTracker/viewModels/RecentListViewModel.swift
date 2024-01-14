//
//  MainViewModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-12.
//

import Foundation
import CoreData
import Combine

class RecentListViewModel: ObservableObject {
    @Published var recentTransactionsListElements: [ExpenseTracker] = []
    @Published var totalAmountGraph: Double = 0.0

    private var cancellables: Set<AnyCancellable> = []

    init() {
        // Configurar el observador para notificaciones de cambios en el contexto de Core Data
        NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
            .sink { [weak self] _ in
                self?.getRecentTransactions()
            }
            .store(in: &cancellables)
    }

    func getRecentTransactions() {
        recentTransactionsListElements = ExpenseTrackerModel.shared.getRecentTransactions()
        totalAmountGraph = recentTransactionsListElements.reduce(0.0) { $0 + $1.amount }
        print("Número de elementos en la lista: \(recentTransactionsListElements.count)")
    }

    func deleteTransactionElement(task: ExpenseTracker) {
        ExpenseTrackerModel.shared.deleteTransaction(task: task)
        totalAmountGraph = recentTransactionsListElements.reduce(0.0) { $0 + $1.amount }
        // No es necesario llamar a getRecentTransactions() aquí ya que el modelo Core Data notificará el cambio
    }
    
    func getAllTransactions() {
        recentTransactionsListElements = ExpenseTrackerModel.shared.getAllTransactions()
        totalAmountGraph = recentTransactionsListElements.reduce(0.0) { $0 + $1.amount }
        print("Número de elementos en la lista total: \(recentTransactionsListElements.count)")
    }

    func getTotalAmount() -> Double {
         let total = recentTransactionsListElements.reduce(0.0) { $0 + $1.amount }
         return total
     }
    
    func getAmounts() -> [Double] {
        let sortedTransactions = recentTransactionsListElements.sorted(by: {
                if let date1 = $0.date, let date2 = $1.date {
                    return date1 < date2
                }
                return false
            })

            return sortedTransactions.map { $0.amount }
    }
}

