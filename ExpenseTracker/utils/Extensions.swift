//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-01.
//

import Foundation
import SwiftUI

//this extension is used to get the custom colors in a easy way
extension Color {
    static let backgroundAsset = Color("Background")
    static let iconAsset = Color("Icon")
    static let textRedAsset = Color("TextRed")
    static let textGreenAsset = Color("TextGreen")
    static let addTransactionColor = Color("AddTransaction")
    static let textFieldColor = Color("TextFieldBg")
    static let fontColor = Color("FontColor")
    static let systemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter{
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}



extension String{
    func dateParsed() -> Date {
        guard let parsedData = DateFormatter.dateFormatter.date(from: self) else {return Date()}
        return parsedData
    }
}
