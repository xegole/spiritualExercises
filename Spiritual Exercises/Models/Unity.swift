import Foundation

struct Unity: Codable {
    
    let id: String
    let idUnity: String
    let idCourse: String
    let idModule: String
    let order: String
    let number: String
    let title: String
    let links: [String]
    
    enum CodingKeys: String,CodingKey{
        case id
        case idUnity = "idUnidad"
        case idCourse = "idCurso"
        case idModule = "idModulo"
        case order = "orden"
        case number = "numero"
        case title = "titulo"
        case links
    }
}
