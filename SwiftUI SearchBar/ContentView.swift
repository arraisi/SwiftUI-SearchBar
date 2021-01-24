//
//  ContentView.swift
//  SwiftUI SearchBar
//
//  Created by Abdul R. Arraisi on 24/01/21.
//

import SwiftUI

struct ContentView: View {
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                SearchBarView(text: $searchText, placeholder: "Search")
                
                List {
                    
                    ForEach(
                        self.days.filter {
                            self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                        }, id: \.self) { val in
                        
                        Text(val)
                    }
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("DaysOfAWeek")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
