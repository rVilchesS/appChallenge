import UIKit

class SearchScreenViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    // MARK: Call to view model of Category
    var viewModelCategory = CategoryViewModel()
    

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
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            _ = search
            viewModelCategory.getCategoryData(categorySearch: search.lowercased()) { [self] category in
                self.labelPrueba.text = category.category_id
                let enteredCategory = category.category_id
                print(enteredCategory)
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
                return cell
    }
}
