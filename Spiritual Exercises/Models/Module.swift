import Foundation

struct Module: Codable {
    
    let id: String
    let title: String
    let idCourse: String
    let order: String
    let number: String
    
    enum CodingKeys: String,CodingKey{
        case id
        case title = "titulo"
        case idCourse = "idCurso"
        case order = "orden"
        case number = "numero"
    }
}
