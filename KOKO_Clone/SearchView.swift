//
//  SearchBar.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/29.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            Image("icSearchBarSearchGray")
                .padding(.leading, 10)
                .padding(.trailing, 8)
            TextField("想轉一筆給誰呢？", text: $searchText)
                .foregroundColor(Color("steel"))
            
            if isEditing && searchText != "" {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
                
        }
        .frame(height: 36)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("steel").opacity(0.12))
        )
        .padding(.trailing, 15)
        .onTapGesture {
            self.isEditing = true
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""), isEditing: .constant(false))
            .padding(.horizontal, 20)
    }
}
