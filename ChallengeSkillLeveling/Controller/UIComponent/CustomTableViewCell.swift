import UIKit

class CustomTableViewCell: UITableViewCell {

    var isActive: Bool = false
    
    @IBOutlet weak var productImageView: UIImageView! {
        didSet {
            productImageView.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var lblProductName: UILabel! {
        didSet {
            lblProductName.font = UIFont.init(name: "ProximaNova-Regular", size: 13)
        }
    }
    @IBOutlet weak var lblPrice: UILabel! {
        didSet {
            lblPrice.font = UIFont.init(name: "ProximaNova-Regular", size: 20)
        }
    }
    @IBOutlet weak var lblDescription1: UILabel! {
        didSet {
            lblDescription1.font = UIFont.init(name: "ProximaNova-Regular", size: 11)
        }
    }
    @IBOutlet weak var lblDescription2: UILabel! {
        didSet {
            lblDescription2.font = UIFont.init(name: "ProximaNova-Regular", size: 11)
        }
    }
    
    @IBOutlet weak var favButton: UIButton! {
        didSet {
            favButton.layer.opacity = 0.95
        }
    }
    
    func setup(title: String = "", url: String = "", price: Int = 0, description: String = "", moreDescription: String = "") {
        lblProductName.text = title
        lblPrice.text = ("$ " + String(price))
        lblDescription1.text = description
        lblDescription2.text = moreDescription
        productImageView.setImage(from: url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        // Configure the view for the selected state
    }
    
    
    @IBAction func favButtonAction(_ sender: Any) {
        if isActive {
            isActive = false
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            isActive = true
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
}

extension UIImageView {
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
