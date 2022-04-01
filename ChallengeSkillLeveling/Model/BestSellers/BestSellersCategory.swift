import Foundation

struct BestSellersCategory : Codable {
    let query_data : QueryData
    let content : [Content]

//    enum CodingKeys: String, CodingKey {
//
//        case query_data = "query_data"
//        case content = "content"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        query_data = try values.decodeIfPresent(Query_data.self, forKey: .query_data)
//        content = try values.decodeIfPresent([Content].self, forKey: .content)
//    }

}
