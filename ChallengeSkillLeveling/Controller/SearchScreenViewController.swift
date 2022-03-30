import UIKit

class SearchScreenViewController: UIViewController, UITableViewDelegate {
    
    // MARK: Call to view model of Category
    var viewModelCategory = CategoryViewModel()
    
    
    var enteredCategory: String = "lavadora"

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
        
        // Close keyboard by touching anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
//        //prueba de conexion
//        viewModelCategory.getCategoryData(categorySearch: enteredCategory, completion: Void)
//
//
        viewModelCategory.getCategoryData(categorySearch: enteredCategory) { [self] category in

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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
                return cell
    }
    
    
}

//extension SearchScreenViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//
//    }
//
//  func updateSearchResultsForSearchController(searchController: UISearchController) {
//    filterContentForSearchText(searchController.searchBar.text!)
//  }
//}
