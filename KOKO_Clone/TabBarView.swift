//
//  TabBarView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/5/1.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    
    var body: some View {
        HStack(spacing: 45) {
            Image("icTabbarProductsOff")
                .padding(.top, 20)
            Image("icTabbarFriendsOn")
                .padding(.top, 20)
            Image("icTabbarHomeOff")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    kokoVM.situation = .selection
                }
            Image("icTabbarManageOff")
                .padding(.top, 20)
            Image("icTabbarSettingOff")
                .padding(.top, 20)
        }
        .background(Image("imgTabbarBg"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(KOKOViewModel())
            .previewLayout(.sizeThatFits)
    }
}
