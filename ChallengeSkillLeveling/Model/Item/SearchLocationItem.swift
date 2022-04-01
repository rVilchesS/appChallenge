import Foundation
struct SearchLocationItem : Codable {
    let neighborhood : NeighborhoodItem?
    let city : CityItem?
    let state : StateItem?
}
