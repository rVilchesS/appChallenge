import UIKit
import Alamofire

class CategoryViewModel {
        
    let apiClient = AlamofireAPIClient()
//    weak var vc: SearchScreenViewController?
    var arrCategory = [Category]()
    
    func getCategoryData(categorySearch: String? = nil, completion: @escaping (Category) -> Void){
        
        var url = "https://api.mercadolibre.com/sites/MLA/domain_discovery/search?limit=1"
        
        if let cat = categorySearch {
            url.append(contentsOf: "&q=\(cat)")
        }
        
        apiClient.get(url: url) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decod = try JSONDecoder().decode([Category].self, from: data)
                        
                        for modelCategory in decod {
                            self.arrCategory.append(modelCategory)
                            completion(modelCategory)
                        }
//                        print(self.arrCategory)
//                        self.arrCategory.append(contentsOf: decod)
//                        print(decod)
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription)")
                }
            case .failure(_):
                print("Error, no entro al success")
            }
        }
    }
}

