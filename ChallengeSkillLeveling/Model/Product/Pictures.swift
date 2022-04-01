import Foundation

struct Pictures : Codable {
    let id : String?
    let url : String?
    let suggested_for_picker : [String]?
    let max_width : Int?
    let max_height : Int?
}
