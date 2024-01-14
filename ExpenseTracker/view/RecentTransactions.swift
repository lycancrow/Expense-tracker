//
//  RecentTransactions.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-03.
//

import SwiftUI

struct RecentTransactions: View {
    var body: some View {
        VStack{
            HStack{
                Text("Recent transactions")
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Divider()
            }
        }.padding()
            .background(Color.systemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    RecentTransactions()
}
