//
//  ContentView.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/4/30.
//

import SwiftUI


enum Situation {
    case selection
    case noFriends
    case onlyFriends
    case friendsAndInvite
}

struct ContentView: View {
    
    @EnvironmentObject var kokoVM: KOKOViewModel
    

    var body: some View {
        
        switch kokoVM.situation {
        case .selection:
            SelectionView()
        case .noFriends:
            NoFriendsView()
                .environmentObject(kokoVM)
        case .onlyFriends:
            OnlyFriendsView()
                .environmentObject(kokoVM)
        case .friendsAndInvite:
            FriendsAndInviteView()
                .environmentObject(kokoVM)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(KOKOViewModel())
    }
}
