import Foundation

struct ShippingProduct : Codable {
    let mode : String?
    let tags : [String]?
    let free_shipping : Bool?
    let logistic_type : String?
    let store_pick_up : Bool?
}
