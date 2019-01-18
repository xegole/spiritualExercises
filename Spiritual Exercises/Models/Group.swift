import Foundation

struct Group: Codable{
    
    let id: String
    let name: String
    let group: String
    
    enum CodingKeys: String,CodingKey{
        case id
        case name = "nombre"
        case group = "grupo"
    }
}
