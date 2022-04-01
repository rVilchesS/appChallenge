import Foundation

struct Content : Codable {
    let id : String
    let position : Int
    let type : String

//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case position = "position"
//        case type = "type"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        position = try values.decodeIfPresent(Int.self, forKey: .position)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//    }

}
