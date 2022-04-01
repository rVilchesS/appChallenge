import Foundation

struct AttributesProduct : Codable {
    let id : String?
    let name : String?
    let value_id : String?
    let value_name : String?
    let values : [Values]?
    let meta : Meta?
}
