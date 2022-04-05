import Foundation
struct VariationsItem : Codable {
    let id : Int?
    let price : Double?
    let attribute_combinations : [AttributeCombinationsItem]?
    let available_quantity : Int?
    let sold_quantity : Int?
    let sale_terms : [String]?
    let picture_ids : [String]?
    let catalog_product_id : String?
}
