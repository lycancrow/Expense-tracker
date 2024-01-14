//
//  TransactionListElement.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-03.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionListElement: View {
   // var transactionsModel : CategoryIcon
    
    var body: some View {
        HStack (spacing:20){
            //icon element
            RoundedRectangle(cornerRadius: 20, style:  .continuous)
                .fill(Color.icon.opacity(0.15))
                .frame(width: 44, height: 44)
                .overlay{
                    //FontIcon.text(.awesome5Solid(code: "transactionsModel.icon"), fontsize: 24,color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6){
            
                //transaction Name
                Text("hola")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(2)
                
                //transaction Category
                Text("transactionsModel.category")
                    .font(.subheadline)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                    
                //date of Transaction
                Text(" fecha")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            //Transaction value
            
        }
        .padding([.top, .bottom], 8)
        
    }
}


   
