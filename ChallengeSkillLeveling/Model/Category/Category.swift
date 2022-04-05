import Foundation

struct Category : Codable {
    let domain_id : String
    let domain_name : String
    let category_id : String
    let category_name : String
    let attributes : [Attributes]
}
