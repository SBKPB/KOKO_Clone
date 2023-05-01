//
//  SelectionView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/5/1.
//

import SwiftUI

struct SelectionView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                kokoVM.situation = .noFriends
            }, label: {
                Text("無好友畫⾯")
            })
            .buttonStyle(SelectionStyle(color: Color("booger")))
            
            Button(action: {
                kokoVM.situation = .onlyFriends
            }, label: {
                Text("只有好友列表")
            })
            .buttonStyle(SelectionStyle(color: Color("blue")))
            
            Button(action: {
                kokoVM.situation = .friendsAndInvite
            }, label: {
                Text("好友列表含邀請")
            })
            .buttonStyle(SelectionStyle(color: Color("orange")))
        }
    }
}


struct SelectionStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .font(.title3)
            .frame(width: 315, height: 70)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(40)
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
            .environmentObject(KOKOViewModel())
    }
}
