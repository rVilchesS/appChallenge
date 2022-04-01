import UIKit
import Alamofire

class ViewModel {
        
    let apiClient = AlamofireAPIClient()
    weak var vc: SearchScreenViewController?
    var arrBestSellers = [BestSellersCategory]()
    var arrProducts = [ProductDetail]()
    var arrItems = [ItemDetail]()
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
    
    func getBestSellersData(idCategory: String? = nil, completion: @escaping (BestSellersCategory) -> Void){
        
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
                        
//                        for modelBestSellers in decod {
//                            self.arrBestSellers.append(modelBestSellers)
//                            completion(modelBestSellers)
//                        }
////                        print(self.arrCategory)
//                        self.arrBestSellers.append(contentsOf: decod)
//                        DispatchQueue.main.async {
//                            self.vc?.customTableView.reloadData()
//                        }
                        
                        
                        completion(decod)
                        
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription) ** Best Sellers")
                }
            case .failure(let error):
                print("Error: \(error) ** Best Sellers Failure")
            }
        }
    }

    
    func getProducts(bestSellerProducts: BestSellersCategory, completion: @escaping (ProductDetail) -> Void){
        
//        var url = "https://api.mercadolibre.com/items?ids="
        
        var url = "https://api.mercadolibre.com/products/MLA17418994"
        
//        var idProducts: String = ""
//
//        bestSellerProducts.content.forEach { value in
//            if idProducts == "" {
//                idProducts = value.id
//            } else {
//                idProducts = idProducts + "," + value.id
//            }
//        }
        
//        url.append(contentsOf: idProducts)
        
        apiClient.get(url: url) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decod = try JSONDecoder().decode(ProductDetail.self, from: data)
                        
                        
                        self.arrProducts.append(decod)
//                        print(self.arrProducts)
                            
                        
////                        print(self.arrCategory)
//                        self.arrProducts.append(contentsOf: decod)
//                        DispatchQueue.main.async {
//                            self.vc?.customTableView.reloadData()
//                        }
                        completion(decod)
                    }
                } catch let err {
                    print("Error: \(err.localizedDescription) ** Product")
                }
            case .failure(let error):
                print("Error: \(error) ** Product Failure")
            }
        }
    }
    
    func getItems(bestSellerProducts: BestSellersCategory, completion: @escaping (ItemDetail) -> Void){
        
//        var url = "https://api.mercadolibre.com/items?ids="
        
        var url = "https://api.mercadolibre.com/items/MLA1103413562"
        
//        var idProducts: String = ""
//
//        bestSellerProducts.content.forEach { value in
//            if idProducts == "" {
//                idProducts = value.id
//            } else {
//                idProducts = idProducts + "," + value.id
//            }
//        }
        
//        url.append(contentsOf: idProducts)
        
        apiClient.get(url: url) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decod = try JSONDecoder().decode(ItemDetail.self, from: data)
                        
                        
                        self.arrItems.append(decod)
                        print(self.arrItems)
                            
                        
////                        print(self.arrCategory)
//                        self.arrProducts.append(contentsOf: decod)
//                        DispatchQueue.main.async {
//                            self.vc?.customTableView.reloadData()
//                        }
                        completion(decod)
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

