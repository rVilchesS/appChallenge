import Foundation

struct Products : Codable {
    let product_id : String?
    let picker_label : String?
    let picture_id : String?
    let thumbnail : String?
    let tags : [String]?
    let permalink : String?
}
