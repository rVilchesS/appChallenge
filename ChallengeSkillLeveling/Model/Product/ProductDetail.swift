import Foundation

struct ProductDetail : Codable {
    let id : String?
    let status : String?
    let sold_quantity : Int?
    let domain_id : String?
    let permalink : String?
    let name : String?
    let family_name : String?
    let buy_box_winner : BuyBoxWinnerProduct?
    let buy_box_winner_price_range : BuyBoxWinnerPriceRangeProduct?
    let pickers : [PickersProduct]?
    let pictures : [PicturesProduct]?
    let main_features : [MainFeaturesProduct]?
    let attributes : [AttributesProduct]?
    let short_description : ShortDescriptionProduct?
    let parent_id : String?
    let children_ids : [String]?
    let settings : SettingsProduct?
}

