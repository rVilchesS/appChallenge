import Foundation

struct ProductDetail : Codable {
    let id : String?
    let status : String?
    let sold_quantity : Int?
    let domain_id : String?
    let permalink : String?
    let name : String?
    let family_name : String?
    let buy_box_winner : BuyBoxWinner?
    let buy_box_winner_price_range : BuyBoxWinnerPriceRange?
    let pickers : [Pickers]?
    let pictures : [Pictures]?
    let main_features : [MainFeatures]?
    let attributes : [AttributesProduct]?
    let short_description : ShortDescription?
    let parent_id : String?
    let children_ids : [String]?
    let settings : Settings?
}

