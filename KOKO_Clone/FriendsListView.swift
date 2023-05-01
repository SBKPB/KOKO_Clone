//
//  FriendsListView.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import SwiftUI

struct FriendsListView: View {
    
    @State var searchText = ""
    var friends: [Friend]
    
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                SearchView(searchText: $searchText, isEditing: $isEditing)
                
                Button(action: {}, label: {
                    Image("icBtnAddFriends")
                })
            }
            .padding(.top, 15)
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
            
            ScrollView(showsIndicators: false) {
                ForEach(friends.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)
                }),
                        id: \.fid
                ) { friend in
                    VStack {
                        FriendsRow(friend: friend)
                        
                        Divider()
                            .frame(width: 240, height: 1)
                            .foregroundColor(Color("whiteThree"))
                            .padding(.bottom, 9)
                    }
                }
            }
            .onTapGesture {
                isEditing.toggle()
            }
        }
        
    }
}

struct FriendsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let test_friends: [Friend] = [
            Friend(
                name: "黃靖僑",
                status: 0,
                isTop: "0",
                fid: "001",
                updateDate: "20190801"
            ),
            Friend(
                name: "翁勳儀",
                status: 0,
                isTop: "1",
                fid: "002",
                updateDate: "20190802"
            ),
            Friend(
                name: "洪佳妤",
                status: 1,
                isTop: "0",
                fid: "003",
                updateDate: "20190804"
            ),
        ]
        
        
        FriendsListView(friends: test_friends, isEditing: .constant(false))
    }
}
