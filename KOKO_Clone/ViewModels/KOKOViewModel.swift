//
//  KOKOViewModel.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import Foundation

@MainActor
class KOKOViewModel: ObservableObject {
    @Published var user: User = User(name: "無使用者")
    @Published var friends: [Friend] = []
    
    @Published var situation: Situation = .selection
    
    @Published var invite: [Friend] = []
    
    
    
    @Published var friendsNum: Int = 0
    
    var fetchKOKOService: FetchKOKOService = FetchKOKOService()
    
    
    func fetchUser() async {
        do {
            if let user = try await fetchKOKOService.fetchUser() {
                self.user = user
            }
        } catch {
            print("無使用者資料")
        }
    }
    
    func fetchEmptyFriend() async {
        do {
            
            let emptyFriends = try await fetchKOKOService.fetchEmptyFriend() ?? []
            
            self.friends = emptyFriends
            
        } catch {
            print("取得資料錯誤")
        }
    }
    
    
    func ferchFriends() async {

        do {
            let friends1 = try await fetchKOKOService.fetchFriend1() ?? []
            let friends2 = try await fetchKOKOService.fetchFriend2() ?? []

            self.friends = self.merge(friends1, friends2)
            self.friendsNum = self.friends.count
            
        } catch {
            print("取得資料失敗")
        }
        
    }
    
    func ferchFriendsAndInvite() async {

        do {
            var data = try await fetchKOKOService.fetchFriend3() ?? []
            var inviteFriends: [Friend] = []
            var friends: [Friend] = []
            var friendsNum: Int = 0
            
            for friend in data {
                if friend.status == 0 {
                    inviteFriends.append(friend)
                } else {
                    friends.append(friend)
                    if friend.status == 2 { friendsNum += 1 }
                            
                }
            }
            
            
            self.friendsNum = friendsNum
            self.friends = friends
            self.invite = inviteFriends
            
        } catch {
            print("取得資料失敗")
        }
        
    }
    
    
    func merge(_ data1: [Friend], _ data2: [Friend]) -> [Friend]{
        
        var friends: [Friend] = []
        
        var fidTable: [String] = []
        
        
        
        
        for friend in data1 {
            if fidTable.contains(friend.fid) {
                let index = friends.firstIndex{ $0.fid == friend.fid }
                if stringToDate(friends[index!].updateDate) < stringToDate(friend.updateDate) {
                    friends[index!] = friend
                }
            } else {
                fidTable.append(friend.fid)
                friends.append(friend)
            }
        }
        
        for friend in data2 {
            if fidTable.contains(friend.fid) {
                let index = friends.firstIndex{ $0.fid == friend.fid }
                if friends[index!].updateDate < friend.updateDate {
                    friends[index!] = friend
                }
            } else {
                fidTable.append(friend.fid)
                friends.append(friend)
            }
        }
        
        
        return friends
    }
    
    
    func stringToDate(_ str: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        guard let date = formatter.date(from: str) else {
            formatter.dateFormat = "yyyyMMdd"
            return formatter.date(from: str)!
        }
        
        return date
        
    }
    
}
