import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-7456735676843100-033118-06b2279ffd2762f938f1a60a407f296e-168898401")]
                
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}

