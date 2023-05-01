//
//  OnlyFriendsView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/5/1.
//

import SwiftUI

struct OnlyFriendsView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            if !isEditing {
                VStack {
                    HeaderView()
                        .environmentObject(kokoVM)
                    
                    Spacer()
                    
                    HStack(spacing: 36) {
                        Button(action: {}, label: {
                            VStack(spacing: 0) {
                                Text("好友")
                                    .foregroundColor(Color("greyishBrown"))
                                    .bold()
                                
                                
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
                .frame(height: 192)
                .padding(.horizontal, 20)
                .background(Color("white-Two"))
            }
            
            
            
            ZStack(alignment: .bottom) {
                FriendsListView(friends: kokoVM.friends, isEditing: $isEditing)
                    .refreshable {
                        Task {
                            await kokoVM.ferchFriends()
                        }
                    }
                .padding(.horizontal, 20)
                
                TabBarView()
                    .environmentObject(kokoVM)
            }
            
            
        }
        .task {
            await kokoVM.fetchUser()
            await kokoVM.ferchFriends()
        }
    }
}

struct OnlyFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        OnlyFriendsView()
            .environmentObject(KOKOViewModel())
            
    }
}
