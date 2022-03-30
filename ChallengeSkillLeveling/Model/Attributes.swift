import Foundation

struct Attributes : Codable {
    let id : String
    let name : String
    let value_id : String
    let value_name : String

//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case value_id = "value_id"
//        case value_name = "value_name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
//        value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
//    }

}
