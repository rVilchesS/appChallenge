import Foundation

struct PickersProduct : Codable {
    let picker_id : String?
    let picker_name : String?
    let products : [Products]?
    let tags : [String]?     // array?
    let attributes : [AttributesPickersProduct]?
}
