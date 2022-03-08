//
//  UserManager.swift
//  myChatApp
//
//  Created by Eslam Ali  on 08/03/2022.
//

import Foundation
import Firebase

class UserManager {
    static let shared =  UserManager()
    
    private init () {}
    
//MARK:- Registration Function
    
    func registration(email : String, password :  String, completion: @escaping (_ error : Error?)-> Void )  {
        Auth.auth().createUser(withEmail: email, password: password) { (results, error) in
            guard error == nil else  {
                print("something went worng....")
                completion(error)
                return
            }
            
            results?.user.sendEmailVerification(completion: { (error) in
                print(error?.localizedDescription)
            })
            
            if results?.user != nil {
                let user =  User(id: results!.user.uid, username: email, email: email, pushID: "", avatarLink: "", status: "hey i'm using this chat App ")
                self.saveUserToFirestore(user: user)
                saveUserLocally(user)
            }
            
             
        }
    }
    
    func saveUserToFirestore(user: User)  {
        firestoreReferance("Users").document(user.id).setData(["email" : user.email, "username" : user.username, "pushID" : user.pushID, "avatarLink" : user.avatarLink, "status" : user.status] )
    }
    
    
    
}
