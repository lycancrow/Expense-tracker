//
//  RecentListViewModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-13.
//

import SwiftUI

struct RecentList: View {
    
    @StateObject private var recentListViewModel = RecentListViewModel()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    
    var body: some View {
        
        let currentDate = Date()
        
        VStack{
            List {
                ForEach(recentListViewModel.recentTransactionsListElements, id: \.id) { transaction in
                    HStack{
                        VStack{
                            Image(systemName: transaction.category ?? "wand.and.stars")
                                .foregroundColor(Color.teal)
                                .font(.system(size: 25, weight: .bold))
                                .padding()
                            
                        }
                        VStack(alignment: .leading) {
                            Text("\(transaction.transactionName ?? "Not Provided")").font(.title)
                            Text("\(currentDate, formatter: Self.dateFormatter)")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack{
                            Text(TransactionList.currencyFormatter.string(from: NSNumber(value: transaction.amount )) ?? "").foregroundColor(transaction.amount >= 0 ? Color.black : Color.red)
                            
                        }
                        
                    }
                }
                .onDelete { indexSet in
                    // Eliminar las transacciones seleccionadas
                    for index in indexSet {
                        let transaction = recentListViewModel.recentTransactionsListElements[index]
                        recentListViewModel.deleteTransactionElement(task: transaction)
                    }
                }
                .background(Color.white)
                
            }.padding()
                .listStyle(PlainListStyle())
                .background(Color.white)
        }.onAppear {
            recentListViewModel.getRecentTransactions()
        }
    }
}

#Preview {
    RecentList()
}
