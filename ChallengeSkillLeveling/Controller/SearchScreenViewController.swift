import UIKit

class SearchScreenViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: Call to view model of Category
    var viewModel = ViewModel()
    
    // MARK: Attributes
    var enteredCategory = ""
    var productMultiget = [String]()
    var itemMultiget: String = ""
    var genericObj = [GenericObj]()
    var positionProduct: Int = 0
    var positionItem: Int = 0

    // MARK: Outlets
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var customSearch: UISearchBar! 

    
    // MARK: Hide NavBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: ViewDidLoad
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
        
        // changes the color for searchBar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#FDDD11")
        view.backgroundColor = hexStringToUIColor(hex: "#FDDD11")
    }
    
    // MARK: Function SearchBar to reuqest viewModel
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchBar.text?.isEmpty != nil) {
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
                                genericObj.append(GenericObj(id: items.body?.id ?? "", title: items.body?.title ?? "", image: items.body?.thumbnail ?? "", detailImage: items.body?.pictures?[0].url ?? "", price: items.body?.price ?? 0, description: items.body?.subtitle ?? "" , moreDescription: items.body?.warranty ?? ""))
                            }
                            customTableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

// MARK: Extension for aditionals functions
extension SearchScreenViewController {
    // function to close keyboard by touching anywhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: Extension UITableViewDataSource
extension SearchScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        genericObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if genericObj.isEmpty {
            return UITableViewCell()
        }

        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        
        let item = genericObj[indexPath.row]
        cell?.setup(title: item.title ?? "", url: item.image ?? "", price: Int(item.price ?? 0), description: item.description ?? "", moreDescription: item.moreDescription ?? "")
        return cell ?? UITableViewCell()
    }
}

// MARK: Extension UITableViewDelegate
extension SearchScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        customTableView.deselectRow(at: indexPath, animated: true)

        let detailItem = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detailItem, animated: true)
        detailItem.idItem = (genericObj[indexPath.row].id) ?? ""
        detailItem.titleItem = (genericObj[indexPath.row].title)?.capitalized ?? ""
        detailItem.subTitleItem = (genericObj[indexPath.row].title)?.capitalized ?? ""
        detailItem.urlImage = (genericObj[indexPath.row].detailImage) ?? ""
        detailItem.priceItem = Int((genericObj[indexPath.row].price) ?? 0)
    }
}
