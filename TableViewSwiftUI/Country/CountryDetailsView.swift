//
//  CountryDetailsView.swift
//  TableViewSwiftUI
//
//  Created by Akshay Nandane on 28/06/23.
//

import SwiftUI

struct CountryDetailsView: View {
    var countryName: String
    
    init(countryName: String) {
        self.countryName = countryName
    }
    
    var body: some View {
        Text("Hello, \(countryName)!")
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(countryName: "")
    }
}
