//
//  TransactionList.swift
//  Moneyo
//
//  Created by Bartosz Warszyński on 16/02/2023.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: Grupowanie transakcji
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        // MARK: Lista transakcji
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        // MARK: Miesiąc transakcji
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            
            .listStyle(.plain)
        }
        .navigationTitle("Transakcje")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
