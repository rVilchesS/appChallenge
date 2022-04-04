import Foundation
struct AttributeCombinationsItem : Codable {
    let id : String?
    let name : String?
    let value_id : String?
    let value_name : String?
    let value_struct : String?
    let values : [ValuesItem]?
    let attribute_group_id : String?
    let attribute_group_name : String?
}
