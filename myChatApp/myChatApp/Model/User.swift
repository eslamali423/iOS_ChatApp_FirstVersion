//
//  User.swift
//  myChatApp
//
//  Created by Eslam Ali  on 08/03/2022.
//

import Foundation
import Firebase


struct User : Codable {
    var id = ""
    var username : String
    var email : String
    var pushID = ""
    var avatarLink = ""
    var status : String
}


func saveUserLocally(_ user : User) {
    do{
        let data = try  JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: "currentUser")
        
    }catch {
        print(error.localizedDescription)
    }
}
