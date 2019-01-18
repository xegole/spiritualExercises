import Foundation

enum SideMenuItem: Int{
    case home
    case moreInformation
    case extraMaterial
    case consultation
    case donate
    case profile
    case share
    
    init(index: Int32) {
        switch index {
        case 0: self = .home
        case 1: self = .moreInformation
        case 2: self = .extraMaterial
        case 3: self = .consultation
        case 4: self = .donate
        case 5: self = .profile
        case 6: self = .share
        default: self = .home
        }
    }
}
