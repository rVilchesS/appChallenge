import UIKit

class FavoritesViewController: UIViewController {

    // MARK: Call to view model of Category
    var viewModel = ViewModel()
    
    
    var genericFav = [GenericObj]()
    let arrFav = Array(FavoritesList.shared.getFavorites())
    var listFav: String = ""
    
    // Transform set to array
//    let arrFav = [String](FavoritesList.getFavorites())
    
//    for fav in listFavorites {
//        print(fav)
//    }

    @IBOutlet weak var customListFavTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customListFavTableView.dataSource = self
        customListFavTableView.delegate = self
        customListFavTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        getListFav()
    }
    
    private func getListFav() {
        customListFavTableView.reloadData()
    }

}

extension FavoritesViewController {
    func dataApiFav(values: String) {
//        viewModel.getItems(listItems: listFavorites) { [self] itemsDetail in
//            genericFav = []
//            itemsDetail.forEach { items in
//                genericObj.append(GenericObj(id: items.body?.id ?? "", title: items.body?.title ?? "", image: items.body?.thumbnail ?? "", detailImage: items.body?.pictures?[0].url ?? "", price: items.body?.price ?? 0, description: items.body?.subtitle ?? "" , moreDescription: items.body?.warranty ?? ""))
//            }
//            customListFavTableView.reloadData()
//        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        listFavorites.count
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.customListFavTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = listFavorites[indexPath.row]
        return cell
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
}
