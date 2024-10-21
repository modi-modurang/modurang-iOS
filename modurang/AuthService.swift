//
//  AuthService.swift
//  modurang
//
//  Created by dgsw21 on 10/11/24.
//

import Foundation
import Alamofire

struct SignupRequest: Codable {
    let username: String
    let password: String
    let email: String
}

struct LoginRequest: Codable {
    let username: String
    let password: String
}

class APIService {
    
    static let shared = APIService() // 싱글톤 패턴 사용 (필요에 따라)
    
    // 회원가입
    func signup(username: String, password: String, email: String, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "https://yourserver.com/signup"
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "email": email
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // 로그인
    func login(username: String, password: String, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = "https://yourserver.com/login"
        let parameters: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
