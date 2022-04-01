import Foundation
struct SaleTermsItem : Codable {
    let id : String?
    let name : String?
    let value_id : String?
    let value_name : String?
    let value_struct : ValueStructItem?
    let values : [ValuesItem]?
}
