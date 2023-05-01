//
//  FriendsCardView.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/30.
//

import SwiftUI

struct FriendsCardView: View {
    @Binding var isExpand: Bool
    
    var friend: Friend
    
    var body: some View {
        HStack {
            Group {
                Image("imgFriendsList")
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 2) {
                    Text(friend.name)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("greyishBrown"))
                    Text("邀請你成為好友：）")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color("brownGrey"))
                }
                .padding(.leading, 15)
            }
            .onTapGesture {
                isExpand.toggle()
            }
            
            Spacer()
                
            
            Button(action: {}, label: {
                Image("btnFriendsAgree")
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 15)
            })
            
            Button(action: {}, label: {
                Image("btnFriendsDelet")
                    .frame(width: 30, height: 30)
            })
            
            
            
            
        }
        .padding(15)
        .frame(height: 70)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.white)
        )
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
        .padding(.horizontal, 10)
    }
        
}

struct FriendsCardView_Previews: PreviewProvider {
    static var previews: some View {
        let friend =  Friend(
            name: "洪佳妤",
            status: 1,
            isTop: "0",
            fid: "003",
            updateDate: "20190804"
        )
        
        FriendsCardView(isExpand: .constant(false), friend: friend)
            .previewLayout(.sizeThatFits)
           
    }
}
