import Foundation
import Alamofire

// MARK: Conection API with token
class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-7456735676843100-040514-3165de2911c029c87b143cf71feff4c3-168898401")]
                
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}

