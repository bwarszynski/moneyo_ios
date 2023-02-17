//
//  PreviewData.swift
//  Moneyo
//
//  Created by Bartosz Warszyński on 02/02/2023.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "24/01/2023", institution: "Alior Bank", account: "Konto osobiste", merchant: "Apple", amount: 249.95, type: "debit", categoryId: 504, category: "Oprogramowanie", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
