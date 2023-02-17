//
//  MoneyoApp.swift
//  Moneyo
//
//  Created by Bartosz Warszyński on 01/02/2023.
//

import SwiftUI

@main
struct MoneyoApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
