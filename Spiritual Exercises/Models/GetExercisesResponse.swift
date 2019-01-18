import Foundation

struct GetExercisesResponse: Codable{
    
    let exercises: [Exercise]
    let modules: [Module]
    let unities: [Unity]
    let groups: [Group]
    
    enum CodingKeys: String,CodingKey{
        case exercises = "ejercicios"
        case modules = "modulos"
        case unities = "unidades"
        case groups = "grupos"
    }
}
