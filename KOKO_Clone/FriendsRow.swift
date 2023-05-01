//
//  FriendsRow.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import SwiftUI

struct FriendsRow: View {
    
    
    var friend: Friend
    
    var body: some View {
        HStack(spacing: 0) {
            
            Image("icFriendsStar")
                .frame(width: 14, height: 14)
                .padding(.leading, 10)
                .opacity(friend.isTop == "0" ? 0 : 1)
            
            
            Image("imgFriendsList")
                .frame(width: 40, height: 40)
                .padding(.leading, 6)
            
            Text(friend.name)
                .font(.system(size: 16,weight: .regular))
                .foregroundColor(Color("greyishBrown"))
                .padding(.leading, 15)
            
            
            Spacer()
            
            Button(action: {}, label: {
                Text("轉帳")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("hotPink"))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .border(Color("hotPink"), width: 1.2)
                    .cornerRadius(2)
            })
            
            if friend.status == 2 {
                Button(action: {}, label: {
                    Text("邀請中")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("veryLightPinkTwo"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .border(Color("veryLightPinkTwo"), width: 1.2)
                        .cornerRadius(2)
                        
                })
                .padding(.leading, 10)
                
            } else {
                Button(action: {}, label: {
                    Image("icFriendsMore")
                        .frame(width: 18, height: 14)
                })
                .padding(.leading, 25)
                .padding(.trailing, 10)
            }
            
            
            
        }
    }
}

struct FriendsRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let friend = Friend(
            name: "翁勳儀",
            status: 2,
            isTop: "1",
            fid: "002",
            updateDate: "20190802"
        )
        
        FriendsRow(friend: friend)
            .padding(.horizontal, 20)
    }
}
