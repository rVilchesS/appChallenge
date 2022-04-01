import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-7456735676843100-040119-d2cf91383622dd20ed01065762e7a827-168898401")]
                
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}

