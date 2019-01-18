import Foundation

struct WelcomeItem {
    
    let title: String
    let description: String
    let pathImage: String
    
    static func getArrayMock() -> [WelcomeItem] {
        var arrayItems: [WelcomeItem] = []
        
        let item1 = WelcomeItem(title: "item_who_are_we".localized, description: "item_description_who_we_are".localized, pathImage: "whoAreWe")
        let item2 = WelcomeItem(title: "item_what_are_ee".localized, description: "item_description_what_are_ee".localized, pathImage: "whatAreEe")
        let item3 = WelcomeItem(title: "item_how_do_them".localized, description: "item_description_how_do_them".localized, pathImage: "howDoThem")
        let item4 = WelcomeItem(title: "item_who_do_them".localized, description: "item_description_who_do_them".localized, pathImage: "whoDoThem")
        arrayItems.append(item1)
        arrayItems.append(item2)
        arrayItems.append(item3)
        arrayItems.append(item4)
        return arrayItems
    }
}
