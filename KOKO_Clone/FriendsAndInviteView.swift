//
//  FriendsAndInviteView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/5/1.
//

import SwiftUI

struct FriendsAndInviteView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    @State private var isEditing: Bool = false
    @State private var isExpand: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HeaderView()
                    .environmentObject(kokoVM)
                
                Spacer()
                
                
                
                if isExpand && kokoVM.invite.count != 1 {
                    VStack(spacing: 10) {
                        ForEach(kokoVM.invite, id: \.self.fid) { invite in
                            FriendsCardView(isExpand: $isExpand, friend: invite)
                        }
                    }
                    .padding(.bottom, 15)
                } else {
                    ZStack {
                        ForEach(0..<kokoVM.invite.count, id: \.self) { i in
                            if i > 0 {
                                FriendsCardView(isExpand: $isExpand, friend: kokoVM.invite[i])
                                    .scaleEffect(1 -  0.07, anchor: .center)
                                    .offset(x: 0, y:  10)
                                    .zIndex(1)
                            } else {
                                FriendsCardView(isExpand:$isExpand, friend: kokoVM.invite[i])
                                    .zIndex(2)
                            }
                        }
                    }
                    .padding(.bottom, 32)
                }
                
                HStack(spacing: 36) {
                    Button(action: {}, label: {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("好友")
                                    .foregroundColor(Color("greyishBrown"))
                                .bold()
                                
                                Text("\(kokoVM.friendsNum)")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 4.5)
                                    .padding(.vertical, 3.5)
                                    .background(
                                        Capsule()
                                            .fill(Color("softPink"))
                                    )
                                    .offset(x: 3, y: -7)
                            }
                            
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color("hotPink"))
                                .frame(width: 24, height: 4)
                                .opacity(1)
                                .padding(.top, 6)
                        }
                    })
                    
                    
                    Button(action: {}, label: {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("聊天")
                                    .foregroundColor(Color("greyishBrown"))
                                .bold(false)
                                
                                Text("99+")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 4.5)
                                    .padding(.vertical, 3.5)
                                    .background(
                                        Capsule()
                                            .fill(Color("softPink"))
                                    )
                                    .offset(x: 3, y: -7)
                                    
                            }
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color("hotPink"))
                                .frame(width: 24, height: 4)
                                .opacity(0)
                                .padding(.top, 6)
                        }
                    })
                    
                    Spacer()
                }
                .padding(.leading, 10)
                
            }
            .frame(minHeight: 192, maxHeight: (isExpand && kokoVM.invite.count != 1) ? 368 : 299)
            .padding(.horizontal, 20)
            .background(Color("white-Two"))
            
            
            
            ZStack(alignment: .bottom) {
                FriendsListView(friends: kokoVM.friends, isEditing: $isEditing)
                    .refreshable {
                        Task {
                            await kokoVM.ferchFriendsAndInvite()
                        }
                    }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                
                TabBarView()
                    .environmentObject(kokoVM)
            }
        }
        .task {
            await kokoVM.fetchUser()
            await kokoVM.ferchFriendsAndInvite()
        }
    }
}

struct FriendsAndInviteView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsAndInviteView()
            .environmentObject(KOKOViewModel())
    }
}
