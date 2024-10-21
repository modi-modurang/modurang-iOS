//
//  KeychainManager.swift
//  modurang
//
//  Created by dgsw21 on 9/20/24.
//

import Foundation
import Security

enum KeychainError: Error { // 없어도 상관없음
    case invalidData
    case unhandledError(status: OSStatus)
}

class KeychainManager {
    
    private static let key = "TokenKey"
    private static let service = Bundle.main.bundleIdentifier ?? "kr.hs.dgsw.modurang"
    
    static func save(token: String) throws { // 토큰을 저장하는 함수
        guard let data = token.data(using: .utf8) else { // 토큰에 데이터 있으면 token.data(형식 : .utf8)로 저장.
            throw KeychainError.invalidData // 값 없으면 존재하지 않는 데이터라는 오류를 던짐.
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userToken",
            kSecValueData as String: data
        ]
        
        // 기존 항목 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새로운 항목 저장
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
    }
    
    static func get() throws -> String {
        // 가져오기 함수
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userToken",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        //이런건 나도 머리 깨지니 걍 키체인 모듈할때 스위프트 공식문서 보고 복붙해오시면 됩니다.
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        guard let data = item as? Data,
              let token = String(data: data, encoding: .utf8) else {
            throw KeychainError.invalidData
        }
        
        return token // 마지막에 걍 토큰을 돌려줌 = 가져오는거.
    }
    
    static func deleteToken() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userToken"
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        print(query.values)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.invalidData
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        print("Token deleted successfully")
    }
}
