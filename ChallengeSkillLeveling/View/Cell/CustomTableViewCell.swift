import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var lblProductName: UILabel! {
        didSet{
            guard let customFont = UIFont(name: "ProximNova-Regular", size: UIFont.labelFontSize) else {
                fatalError("""
                    Failed to load the "CustomFont-Light" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
                )
            }
            lblProductName.font = UIFontMetrics.default.scaledFont(for: customFont)
            lblProductName.adjustsFontForContentSizeCategory = true
        }
    }
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription1: UILabel!
    @IBOutlet weak var lblDescription2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
