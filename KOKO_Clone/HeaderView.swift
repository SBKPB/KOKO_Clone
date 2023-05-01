//
//  HeaderView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/5/1.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Button(action: {}, label: {
                    Image("icNavPinkWithdraw")
                })
                .padding(.trailing, 24.3)
                Button(action: {}, label: {
                    Image("icNavPinkTransfer")
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("icNavPinkScan")
                })
            }
            
            
           
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(kokoVM.user.name)
                        .font(.system(size: 17))
                    Button(action: {}, label: {
                        HStack(spacing: 10) {
                            if kokoVM.user.kokoid != nil {
                                Text("KOKO ID：\(kokoVM.user.kokoid!)")
                                Image(systemName: "chevron.right")
                            } else {
                                Text("設定 KOKO ID")
                                Image(systemName: "chevron.right")
                                Circle()
                                    .fill(Color("hotPink"))
                                    .frame(width: 10)
                            }
                                
                        }
                        .font(.system(size: 13))
                    })
                    .foregroundColor(Color("greyishBrown"))
                }
                
                Spacer()
                
                Image("imgFriendsFemaleDefault")
                    .frame(width: 52, height: 52)
            }
            .padding(.horizontal, 10)
            .padding(.top, 27)
            .padding(.bottom, 35)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .padding(.horizontal, 20)
            .environmentObject(KOKOViewModel())
            .previewLayout(.sizeThatFits)
    }
}
