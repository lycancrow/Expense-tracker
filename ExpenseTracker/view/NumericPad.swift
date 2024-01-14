//
//  NumericPad.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-06.
//

import SwiftUI

struct NumericPad: View {
    @Binding var numericValue: String
    @Binding var enterColor: Color
    
    var sendButtonAction: () -> Void
    
    
    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", "", "."]
    ]
    
    var body: some View {
        
        
        HStack{
            VStack {
                ForEach(numbers, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { number in
                            Button(action: {
                                if number != "" {
                                    numericValue += number
                                } else if number == "." && !numericValue.contains(".") {
                                    numericValue += number
                                }
                            }) {
                                Text(number)
                            }
                            .padding()
                            .fixedSize()
                            .frame(width: 70)
                            .foregroundColor(Color.fontColor)
                            .bold()
                        }
                    }
                }
            }
            .font(.system(size: 28, weight: .black))
            
            VStack{
                
                Button(action: {
                    if !numericValue.isEmpty {
                        numericValue.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")
                        .font(.system(size: 36))
                        .foregroundColor(Color.fontColor)
                        .padding(16)
                }
                
                Button(action: {
                    
                    sendButtonAction()
                }, label: {
                    ZStack{
                        
                        Rectangle()
                            .fill(enterColor)
                            .opacity(0.9)
                            .frame(height: 200)
                        Text("SEND")
                            .font(.system(size: 24))
                            .foregroundColor(Color.black)
                    }
                })
                
                
            }
            
        }.background(Color.backgroundAsset)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .padding(.horizontal)
        
        
    }
}
