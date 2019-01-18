import Foundation

struct Exercise: Codable{
    
    let id: String
    let title: String
    let description: String
    
    enum CodingKeys: String,CodingKey{
        case id
        case title = "titulo"
        case description = "descripcion"
    }
}
