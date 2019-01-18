import Foundation

extension UserDefaults{
    
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setFirstTime(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }
    
    func isFirstTime()-> Bool {
        return bool(forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }
    
    func setUser(value: User){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: value)
        set(encodedData, forKey: UserDefaultsKeys.userData.rawValue)
    }
    
    func getUser() -> User{
        let decoded  = object(forKey: UserDefaultsKeys.userData.rawValue) as! Data
        return NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
    }
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userData
    case isFirstTime
}
