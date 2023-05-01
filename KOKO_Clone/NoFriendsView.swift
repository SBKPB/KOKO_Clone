//
//  NoFriendsView.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import SwiftUI

struct NoFriendsView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HeaderView()
                    .environmentObject(kokoVM)
                
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
                            Text("聊天")
                                .foregroundColor(Color("greyishBrown"))
                                .bold(false)
                            
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
            
            
            VStack(spacing: 0) {
                
                
                VStack(spacing: 0) {
                    Spacer()
                    Image("imgFriendsEmpty")
                        .frame(width: 245, height: 172)
                        
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text("就從加好友開始吧：）")
                            .foregroundColor(Color("greyishBrown"))
                            .font(.system(size: 21, weight: .medium))
                        
                        Text("與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）")
                            .foregroundColor(Color("brownGrey"))
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("加好友")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 96)
                            Image("icAddFriendWhite")

                        }
                        .padding(.horizontal, 8)
                        
                    })
                    .frame(width: 192, height: 40)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("frogGreen"), Color("booger")]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(25)
                    .padding(.top, 25)
                    
                    
                    HStack {
                        Text("幫助好友更快找到你？")
                            .foregroundColor(Color("brownGrey"))
                        Button(action: {}, label: {
                            Text("設定 KOKO ID")
                                .underline()
                        })
                        .foregroundColor(Color("hotPink"))
                        
                    }
                    .font(.system(size: 13, weight: .regular))
                    .padding(.top, 37)
                }
                
                
                Spacer()
                
                TabBarView()
                    .environmentObject(kokoVM)
            }
            .padding(.top, 30)
        }
        .task {
            await kokoVM.fetchEmptyFriend()
        }
    }
}

struct NoFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NoFriendsView()
            .environmentObject(KOKOViewModel())
    }
}
