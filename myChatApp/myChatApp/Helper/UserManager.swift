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
    
    public func canCreateNewUser ( email: String, password:String ,complition: (Bool) -> Void){
        
        complition(true)
    }
    
    func registration(email : String, password :  String, completion: @escaping (_ error : Error?)-> Void )  {
        Auth.auth().createUser(withEmail: email, password: password) { (results, error) in
            guard error == nil else  {
                print("something went worng....")
                print(error?.localizedDescription)
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
    
    func downloadUserFormFirestore(userID : String)  {
        firestoreReferance("Users").document(userID).getDocument { (documentResult, error) in
            guard let document = documentResult , error == nil else {
                print("no data Found")
                return
            }
            print(document)        }
    }
    
    
    func login(email:String, password:String, completion: @escaping (_ error: Error?, _ isEmailVerified : Bool )->Void ) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil && ((authResult?.user.isEmailVerified) != nil)  {
            completion(error,true)
            }else {
                print("something went worng by login ")
                   print(error?.localizedDescription)
            completion(error,true)
                self.downloadUserFormFirestore(userID: authResult!.user.uid)
            }
        }
    }
    
    func saveUserToFirestore(user: User)  {
        firestoreReferance("Users").document(user.id).setData(["email" : user.email, "username" : user.username, "pushID" : user.pushID, "avatarLink" : user.avatarLink, "status" : user.status] )
    }
    
    
    
}
