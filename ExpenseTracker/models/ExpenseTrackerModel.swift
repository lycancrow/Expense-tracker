//
//  ExpenseTrackerModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-07.
//

import Foundation
import CoreData

struct ExpenseTrackerModel{
    
    let persistentContainer: NSPersistentContainer
    static let shared = ExpenseTrackerModel()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    
    func getAllTransactions() -> [ExpenseTracker] {
        let request: NSFetchRequest<ExpenseTracker> = ExpenseTracker.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    
    func getRecentTransactions() -> [ExpenseTracker] {
        let request: NSFetchRequest<ExpenseTracker> = ExpenseTracker.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        request.fetchLimit = 5
        do {
            return try viewContext.fetch(request)
        } catch {
            print("Error al recuperar las tareas recientes: \(error)")
            return []
        }
    }

    
    func saveDataExpense() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
    func deleteTransaction(task: ExpenseTracker) {
        viewContext.delete(task)
        saveDataExpense()
    }
    
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ExpenseTrackerDatabase")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
    
    
}

