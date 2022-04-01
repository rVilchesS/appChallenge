import UIKit

class SearchScreenViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    // MARK: Call to view model of Category
    var viewModel = ViewModel()
    
    var enteredCategory = ""

    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var customSearch: UISearchBar! {
        didSet{
            // agregar acá estilos del search bar
        }
    }
    
    @IBOutlet weak var labelPrueba: UILabel!
    
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
        print(enteredCategory)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            _ = search
            viewModel.getCategoryData(categorySearch: search.lowercased()) { [self] category in
                self.labelPrueba.text = category.category_id
                enteredCategory = category.category_id
                viewModel.getBestSellersData(idCategory: enteredCategory) { [self] bestSellerCategory in
//                    viewModel.getProducts(bestSellerProducts: bestSellerCategory) { value in
//                        print(value.name)
//                    }
                    viewModel.getItems(bestSellerProducts: bestSellerCategory) { ItemDetail in
                        print(ItemDetail.title)
                    }
                    
                }
                customTableView.reloadData()
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
        viewModel.arrBestSellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        
        let modelCategory = viewModel.arrBestSellers[indexPath.row]
//        cell?.lblProductName.text = "\(modelCategory.[content.id])"
        return cell ?? UITableViewCell()
    }
}
