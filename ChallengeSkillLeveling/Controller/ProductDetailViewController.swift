import UIKit

class ProductDetailViewController: UIViewController {

    // MARK: Variables
    var idItem: String = ""
    var titleItem: String = ""
    var subTitleItem: String = ""
    var identitySeller: String = ""
    var urlImage: String = ""
    var priceItem: Int = 0
    var isActive: Bool = false
    
    // MARK: Outlets
    @IBOutlet weak var lblSubTitle: UILabel! {
        didSet {
            lblSubTitle.font = UIFont.init(name: "ProximaNova-Regular", size: 12)
        }
    }
    @IBOutlet weak var lblTitle: UILabel! {
        didSet {
            lblTitle.font = UIFont.init(name: "ProximaNova-Regular", size: 16)
        }
    }
    @IBOutlet weak var lblSellerIdentityVer: UILabel! {
        didSet {
            lblSellerIdentityVer.font = UIFont.init(name: "ProximaNova-Regular", size: 11)
        }
    }
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var lblPrice: UILabel! {
        didSet {
            lblPrice.font = UIFont.init(name: "ProximaNova-Regular", size: 36)
        }
    }
    @IBOutlet weak var btnPreguntar: UIButton! {
        didSet {
            btnPreguntar.layer.cornerRadius = 6
            btnPreguntar.titleLabel?.font =  UIFont(name: "ProximaNova-Semibold", size: 16)
        }
    }
    @IBOutlet weak var btnWhatsApp: UIButton!{
        didSet {
            btnWhatsApp.layer.cornerRadius = 6
            btnWhatsApp.titleLabel?.font =  UIFont(name: "ProximaNova-Semibold", size: 16)
        }
    }
    @IBOutlet weak var btnFavoritos: UIButton!
    @IBOutlet weak var btnCompartir: UIButton!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data from especific item to view
        lblSubTitle.text = subTitleItem
        lblTitle.text = titleItem
        productImage.setImage(from: urlImage)
        lblPrice.text = ("$ "+String(priceItem))
        
        
        // Set top Nav Bar behavior for ALL of app
        let standardAppearance = UINavigationBarAppearance()

        // Prevent Nav Bar color change on scroll view push behind NavBar
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = hexStringToUIColor(hex: "#FDDD11")
        standardAppearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
        
        // Set the same color to top view
        view.backgroundColor = hexStringToUIColor(hex: "#FDDD11")
        
        navigationProductDetail()
    }
    
    // Set right button to navigation bar
    func navigationProductDetail() {
        let button1 = UIBarButtonItem(image: UIImage(named: "Icon shape"))
        let button2 = UIBarButtonItem(image: UIImage(named: "Icon Search"))
        navigationItem.rightBarButtonItems?.append(button1)
        navigationItem.rightBarButtonItems?.append(button2)
    }
    
    // MARK: Action to save or remove favorites
    @IBAction func FavoritosAction(_ sender: Any) {
        if isActive {
            isActive = false
            btnFavoritos.setImage(UIImage(systemName: "heart"), for: .normal)
            FavoritesList.shared.removeFavorite(idItem)
        } else {
            isActive = true
            btnFavoritos.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            FavoritesList.shared.addFavorite(idItem)
            
        }
        print(FavoritesList.shared.getFavorites())
    }
    
}

// MARK: Aditional func for used hex colors
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
