//
//  FetchKOKO.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import Foundation


class FetchKOKOService {
    var session = URLSession.shared
    
    
    func fetchUser() async throws -> User? {
        guard let url = URL(string: "https://dimanyen.github.io/man.json") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let userResponse = try decoder.decode(UserResponse.self, from: data)
        
        
        return userResponse.response.first
    }
    
    
    func fetchEmptyFriend() async throws -> [Friend]? {
        guard let url = URL(string: "https://dimanyen.github.io/friend4.json") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let userResponse = try decoder.decode(FriendResponse.self, from: data)
        
        
        return userResponse.response
    }
    
    
    func fetchFriend2() async throws -> [Friend]? {
        guard let url = URL(string: "https://dimanyen.github.io/friend2.json") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let userResponse = try decoder.decode(FriendResponse.self, from: data)
        
        
        return userResponse.response
    }
    
    func fetchFriend1() async throws -> [Friend]? {
        guard let url = URL(string: "https://dimanyen.github.io/friend1.json") else {
            throw NetworkError.invalidURL
        }
        
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let userResponse = try decoder.decode(FriendResponse.self, from: data)
        
        
        return userResponse.response
    }
    
    
    func fetchFriend3() async throws -> [Friend]? {
        guard let url = URL(string: "https://dimanyen.github.io/friend3.json") else {
            throw NetworkError.invalidURL
        }
        
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let userResponse = try decoder.decode(FriendResponse.self, from: data)
        
        
        return userResponse.response
    }
    
}
