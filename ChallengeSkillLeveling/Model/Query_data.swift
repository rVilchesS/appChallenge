import Foundation

struct Query_data : Codable {
    let highlight_type : String?
    let criteria : String?
    let id : String?

//    enum CodingKeys: String, CodingKey {
//
//        case highlight_type = "highlight_type"
//        case criteria = "criteria"
//        case id = "id"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        highlight_type = try values.decodeIfPresent(String.self, forKey: .highlight_type)
//        criteria = try values.decodeIfPresent(String.self, forKey: .criteria)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//    }

}

