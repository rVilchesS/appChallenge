import Foundation

struct Category : Codable {
    let domain_id : String
    let domain_name : String
    let category_id : String
    let category_name : String
    let attributes : [Attributes]

//    enum CodingKeys: String, CodingKey {
//
//        case domain_id = "domain_id"
//        case domain_name = "domain_name"
//        case category_id = "category_id"
//        case category_name = "category_name"
//        case attributes = "attributes"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
//        domain_name = try values.decodeIfPresent(String.self, forKey: .domain_name)
//        category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
//        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
//        attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
//    }
}
