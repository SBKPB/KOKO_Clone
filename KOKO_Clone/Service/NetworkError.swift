//
//  NetworkError.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "Server 返回無效 Response"
        case .invalidURL:
            return "URL 字串格式錯誤"
        }
    }
    
}
