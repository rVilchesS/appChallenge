import UIKit

class SearchScreenViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    // MARK: Call to view model of Category
    var viewModel = ViewModel()
    
    var enteredCategory = ""
    var productMultiget = [String]()
    var itemMultiget: String = ""
    var items = [String]()
    var products = [String]()
    var genericObj = [GenericObj]()
    var positionProduct: Int = 0
    var positionItem: Int = 0

    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var customSearch: UISearchBar! {
        didSet{
            // agregar acá estilos del search bar
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        customSearch.delegate = self
        
        // Close keyboard by touching anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        viewModel.vc = self
//        viewModelBestSellers.getBestSellersData(idCategory: enteredCategory)
        
//        genericObj.append(GenericObj(id: "222", title: "prueba", description: "descrip", moreDescription: "descrip2", position: 1))
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if ((searchBar.text?.isEmpty) != nil) {
            genericObj = []
            customTableView.reloadData()
        }
        if let text = searchBar.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            genericObj = []
            viewModel.getCategoryData(categorySearch: search.lowercased()) { [self] category in
                enteredCategory = category.category_id
                                        
                viewModel.getBestSellersData(idCategory: enteredCategory) { [self] bestSellers in
                    productMultiget = []
                    itemMultiget = ""
                    
                    bestSellers.last?.content.forEach{ idValue in
                        if idValue.type.contains("PRODUCT") {
                            productMultiget +=  [idValue.id]
                            positionProduct = idValue.position
                        } else if idValue.type.contains("ITEM") {
                            itemMultiget += idValue.id + ","
                            positionItem = idValue.position
                        }
                    }
                    print("Productos: \(productMultiget)")
                    print("Items: \(itemMultiget)")
                    
                    genericObj = []
                    
                    if itemMultiget.isEmpty {
                        customTableView.reloadData()
                    } else {
                        viewModel.getItems(listItems: itemMultiget) { [self] itemsDetail in
                            genericObj = []
                            itemsDetail.forEach { items in
                                genericObj.append(GenericObj(id: items.body?.id ?? "", title: items.body?.title ?? "", image: items.body?.thumbnail ?? "", price: items.body?.price ?? 0, description: "", moreDescription: ""))
                            }
                            
                            customTableView.reloadData()
                            
                        }
                    }
                }
            }
        }
    }
}

extension SearchScreenViewController {
    // function to close keyboard by touching anywhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension SearchScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.arrBestSellers.count
        genericObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if genericObj.isEmpty {
            return UITableViewCell()
        }
//        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
//
//        let modelCategory = viewModel.arrBestSellers[indexPath.row]
////        cell?.lblProductName.text = "\(modelCategory.[content.id])"
//        return cell ?? UITableViewCell()
        
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        
//        guard let item = genericObj[indexPath.row] else {
//            return UITableViewCell()
//        }
//
        
        
        
        let item = genericObj[indexPath.row]
        cell?.setup(title: item.title ?? "", url: item.image ?? "")
        return cell ?? UITableViewCell()
    }
}
