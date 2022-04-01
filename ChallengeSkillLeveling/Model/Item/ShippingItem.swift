import Foundation
struct ShippingItem : Codable {
    let mode : String?
    let free_methods : [FreeMethodsItem]?
    let tags : [String]?
    let dimensions : String?
    let local_pick_up : Bool?
    let free_shipping : Bool?
    let logistic_type : String?
    let store_pick_up : Bool?
}
