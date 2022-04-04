import UIKit
import Alamofire

class ViewModel {
        
    let apiClient = AlamofireAPIClient()
    weak var vc: SearchScreenViewController?
    var arrBestSellers = [BestSellersCategory]()
    var arrProducts = [[ProductDetail]()]
    var arrItems = [[ItemDetail]()]
    var arrCategory = [Category]()
    var enteredCategory: String? = ""
    
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
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription)")
                }
            case .failure(_):
                print("Error, no entro al success")
            }
        }
    }
    
    func getBestSellersData(idCategory: String? = nil, completion: @escaping ([BestSellersCategory]) -> Void){
        
        var url = "https://api.mercadolibre.com/highlights/MLA/category/"
        
        if let idCat = idCategory {
            url.append(contentsOf: "\(idCat)")
        }
        
        apiClient.get(url: url) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decod = try JSONDecoder().decode(BestSellersCategory.self, from: data)
                        self.arrBestSellers.append(decod)
                        completion(self.arrBestSellers)
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription) ** Best Sellers")
                }
            case .failure(let error):
                print("Error: \(error) ** Best Sellers Failure")
            }
        }
    }

    func getItems(listItems: String, completion: @escaping ([ItemMultiget]) -> Void){
            
        let url = "https://api.mercadolibre.com/items?ids=\(listItems)"
        
        apiClient.get(url: url) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decod = try JSONDecoder().decode([ItemMultiget].self, from: data)
                        completion(decod)
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription) ** Item")
                }
            case .failure(let error):
                print("Error: \(error) ** Item Failure")
            }
        }
    }
    
    func getProducts(listProducts: [String], completion: @escaping ([ProductDetail]) -> Void){
        
        for product in listProducts {
            let url = "https://api.mercadolibre.com/products/\(product)"
            
            apiClient.get(url: url) { response in
                switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let decod = try JSONDecoder().decode(ProductDetail.self, from: data)
                            completion([decod])
                        }
                    } catch let err {
                        print("Error: \(err.localizedDescription) ** Product")
                    }
                case .failure(let error):
                    print("Error: \(error) ** Product Failure")
                }
            }
        }
        
    }
}

