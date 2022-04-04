import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-7456735676843100-040322-fa474aab7c47bb1a4c1cd28ed0cd2378-168898401")]
                
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}

