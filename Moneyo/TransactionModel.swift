//
//  TransactionModel.swift
//  Moneyo
//
//  Created by Bartosz Warszyński on 02/02/2023.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int //let to wartości read-only
    let date: String
    let institution: String
    let account: String
    var merchant: String //var to zmienne
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode{
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        return .question
    }

    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}


struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let transportation = Category(id: 1, name: "Auto i transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Rachunki i opłaty", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Rozrywka", icon: .film)
    static let bankFees = Category(id: 4, name: "Opłaty bankowe", icon: .hand_holding_usd)
    static let shopping = Category(id: 5, name: "Zakupy", icon: .shopping_cart)
    static let income = Category(id: 6, name: "Przychód", icon: .dollar_sign)
    static let transfer = Category(id: 7, name: "Przelewy", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Transport publiczny", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Usługi telekomunikacyjne", icon: .mobile_alt, mainCategoryId: 2)
    static let rent = Category(id: 202, name: "Czynsz", icon: .house_user, mainCategoryId: 2)
    static let bills = Category(id: 203, name: "Rachunki", icon: .file_invoice, mainCategoryId: 2)
    static let subscriptions = Category(id: 301, name: "Subskrypcje", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Opłaty bankowe", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Zakupy spożywcze", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restauracje", icon: .utensils, mainCategoryId: 5)
    static let internetShopping = Category(id: 503, name: "Zakupy internetowe", icon: .shopping_bag, mainCategoryId: 5)
    static let software = Category(id: 504, name: "Oprogramowanie", icon: .icons, mainCategoryId: 5)
    static let incomeTransfer = Category(id: 601, name: "Przelew przychodzący", icon: .dollar_sign, mainCategoryId: 6)
    static let credit = Category(id: 701, name: "Limit odnawialny", icon: .exchange_alt, mainCategoryId: 7)
    static let bankTransfer = Category(id: 702, name: "Przelew wychodzący", icon: .money_bill_wave, mainCategoryId: 7)
}

extension Category {
    static let categories: [Category] = [
        .transportation,
        .billsAndUtilities,
        .entertainment,
        .bankFees,
        .shopping,
        .income,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .rent,
        .bills,
        .subscriptions,
        .bankFee,
        .groceries,
        .restaurants,
        .internetShopping,
        .software,
        .incomeTransfer,
        .credit,
        .bankTransfer
    ]
    static let all: [Category] = categories + subCategories
}
