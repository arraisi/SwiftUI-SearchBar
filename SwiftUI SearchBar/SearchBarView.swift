//
//  SearchBarView.swift
//  SwiftUI SearchBar
//
//  Created by Abdul R. Arraisi on 24/01/21.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: Context) {
        uiView.text = text
    }
}

class Coordinator: NSObject, UISearchBarDelegate {

    @Binding var text: String

    init(text: Binding<String>) {
        _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
    }
}
