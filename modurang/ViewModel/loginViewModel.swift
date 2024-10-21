//
//  loginViewModel.swift
//  modurang
//
//  Created by dgsw21 on 9/20/24.
//

import Foundation
import Alamofire

class loginViewModel: ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
//    func login() {
//        let url = ""
//        let parameter: [String: Any] = ["email":email, "password":password]
//        let header: HTTPHeaders = ["Content-Type":"application/json"]
//        
//        AF.request(url, method: .post, parameters: parameter as Dictionary, encoding: JSONEncoding.default, headers: header)
//            .responseDecodable(of:[TokenModel].self) { response in
//                switch response.result{
//                case .success(let data) {
//                    do { // 해라->
//                        try KeychainManager.save(token: data.token) // KeychainManager.save(token:data.token)을 시도해라
//                        self.isLoggedIn = true
//                        // 위에 지정된 변수의 토큰값은 여기서 들어온 data.token 값이다.
//                        print("키체인 저장에 성공하였습니다.")
//                        self.objectWillChange.send() // 아마 나중에 쓸수도 있으니 지우진 않겠습니다.
//                    } catch {
//                        print(error) // 실패시 에러를 프린트.
//                    }
//                }
//                case .failure(let error):
//                    print(debugPrint(error))
//                }}
//    }
    
}
