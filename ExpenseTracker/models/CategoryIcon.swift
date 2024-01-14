//
//  TransactionsModel.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-01.
//

import Foundation
import SwiftUIFontIcon



struct CategoryIcon{
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
    
}

extension CategoryIcon{
    
    //Main Categories
    static let autoAndTransport = CategoryIcon (id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = CategoryIcon (id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = CategoryIcon(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = CategoryIcon(id: 4, name: "Fees & & Charges", icon: .hand_holding_usd)
    static let foodAndDining = CategoryIcon (id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = CategoryIcon (id: 6, name: "Home", icon: .home)
    static let income = CategoryIcon(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = CategoryIcon(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = CategoryIcon(id: 9, name: "Transfer", icon: .exchange_alt)
                         
    
    //Sub Categories
    static let publicTransportation = CategoryIcon (id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = CategoryIcon(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = CategoryIcon(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = CategoryIcon (id: 301, name: "Movies & DVDs", icon: .film, mainCategoryId: 3)
    static let bankFee = CategoryIcon (id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = CategoryIcon(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = CategoryIcon(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = CategoryIcon(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = CategoryIcon (id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = CategoryIcon(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = CategoryIcon(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7)
    static let software = CategoryIcon(id: 801, name: "Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = CategoryIcon (id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)

}

extension CategoryIcon{
    static let categories: [CategoryIcon] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
     ]
    static let subCategories: [CategoryIcon]=[
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
     ]
        
    static let allCategories: [CategoryIcon] = categories + subCategories
}
