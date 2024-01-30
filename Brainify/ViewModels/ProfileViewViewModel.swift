
import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    init() {}

    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }   
    }
}
