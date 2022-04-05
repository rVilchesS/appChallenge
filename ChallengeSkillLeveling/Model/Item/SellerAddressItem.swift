import Foundation
struct SellerAddressItem : Codable {
    let city : CityItem?
    let state : StateItem?
    let country : CountryItem?
    let search_location : SearchLocationItem?
    let id : Int?
}
