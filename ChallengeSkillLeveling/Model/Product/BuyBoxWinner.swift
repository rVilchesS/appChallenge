import Foundation

struct BuyBoxWinner : Codable {
    let item_id : String?
    let category_id : String?
    let seller_id : Int?
    let price : Int?
    let currency_id : String?
    let sold_quantity : Int?
    let available_quantity : Int?
    let installments : Installments?
    let shipping : Shipping?
    let warranty : String?
    let condition : String?
    let sale_terms : [SaleTerms]?
    let official_store_id : Int?
    let original_price : Int?
    let listing_type_id : String?
    let accepts_mercadopago : Bool?
    let seller_address : SellerAddress?
    let international_delivery_mode : String?
    let tags : [String]?
    let item_override_attributes : [String]?
    let seller : Seller?
    let deal_ids : [String]?
    let tier : String?
    let product_id : String?
}

