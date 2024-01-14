//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-03.
//

import SwiftUI
import SwiftUIX

struct TransactionList: View {
    
   
    
    @StateObject private var transactionListViewModel = TransactionListViewModel()
    @State private var filterName: String = ""
    @State private var textColor : Color = Color.black
    
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    
    var body: some View {
        let currentDate = Date()
        
        ZStack{
            
            Color.backgroundAsset.ignoresSafeArea()
            
            VStack{
                
                TextField("Filter by Name", text: $transactionListViewModel.searchText)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 16)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 20))
                                .foregroundColor(Color.fontColor)
                                .font(.system(size: 28))
                                .shadow(color: Color.teal, radius: 10)
                
               
                
                
                
                List {
                    ForEach(transactionListViewModel.filteredTransactions) { transaction in
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
                            let transaction = transactionListViewModel.transactionsListElements[index]
                            transactionListViewModel.deleteTransactionElement(task: transaction)
                        }
                    }
                    .background(Color.white)
                    
                }.padding()
                    .listStyle(PlainListStyle())
                    .background(Color.backgroundAsset)
                
                
                
                HStack{
                    Text("Total").font(.system(size: 28)).bold().padding(.leading)
                    Spacer()
                    Text(TransactionList.currencyFormatter.string(from: NSNumber(value: transactionListViewModel.totalAmountFiltered() )) ?? "")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.trailing)
                        .foregroundColor(transactionListViewModel.getTotalAmount() >= 0 ? Color.black : Color.red)
                }
                
            }.onAppear {
                transactionListViewModel.getAllTransactions()
            }
            
        }
        
    }
    
}

#Preview {
    TransactionList()
}

