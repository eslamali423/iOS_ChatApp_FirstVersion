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
    //MARK:- registration function with email and password
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
              //  saveUserLocally(user)
            }
            
             
        }
    }

    
    //MARK:- login function with email and password
    func login(email:String, password:String, completion: @escaping (_ error: Error?, _ isEmailVerified : Bool )->Void ) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil && authResult!.user.isEmailVerified  {
            completion(error,true)
                self.downloadUserFormFirestore(userID: authResult!.user.uid)

            }else {
                print("something went worng by login ")
                   print(error?.localizedDescription)
            completion(error,false)
            }
        }
    }
    
    //MARK:- uploade user data to firestore database after registration statment
    func saveUserToFirestore(user: User)  {
        do {
            try  firestoreReferance("Users").document(user.id).setData(from: user)

        }catch {
            
        }
    }
    
    
    //MARK:- download user data form firestore database after login statment
    func downloadUserFormFirestore(userID : String)  {
        firestoreReferance("Users").document(userID).getDocument { (documentResult, error) in
            guard let document = documentResult , error == nil else {
                print("no data Found")
                return
            }
            
            let result = Result {
                try document.data(as: User.self)
            }
            
            switch result {
            
            case .success(let userObject):
                if let user =  userObject {
                    saveUserLocally(user)
                }else  {
                    print("User data not found")
                }
            case .failure(let error):
                print(error)
            }
        
           
        }
    }
    
    
    
}
