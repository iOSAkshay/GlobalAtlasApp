//
//  CountryList.swift
//  TableViewSwiftUI
//
//  Created by Akshay Nandane on 28/06/23.
//

import Foundation

class contryListViewModel: ObservableObject {
    @Published var countryModelData: [String] = []
    var manager: FetchManagerProtocol
    
    init(manager: FetchManagerProtocol) {
        self.manager = manager
    }
    
    func getCountryList() {
        Task{
            do {
                let data = try await manager.fetchCountry()
                DispatchQueue.main.async {
                    self.countryModelData = data
                }
            }
            catch {
                print("Error")
            }
        }
    }
}

