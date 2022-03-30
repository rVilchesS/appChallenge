import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-7456735676843100-033014-6e5280838b13d5e380d30393795f791c-168898401")]
                
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}

