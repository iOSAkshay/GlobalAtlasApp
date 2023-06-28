//
//  ContentView.swift
//  TableViewSwiftUI
//
//  Created by Akshay Nandane on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = contryListViewModel(manager: manager() as FetchManagerProtocol)
    
    let countries = countryList
    var body: some View {
        NavigationView(content: {
            VStack {
                List(viewModel.countryModelData, id: \.self) { country in
                    NavigationLink(destination: {
                        CountryDetailsView(countryName: country)
                    }, label: {
                        HStack {
                            Image(systemName: "airplane")
                            Text(country)
                        }
                    }).padding()
                }
            }
            .onAppear(
                perform: {
                    viewModel.getCountryList()
                    print("onAppear is called")
                }
            )
            .onDisappear(
                perform: {
                    print("OnDisappear is called")
                }
            )
            .navigationTitle("Country List")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
