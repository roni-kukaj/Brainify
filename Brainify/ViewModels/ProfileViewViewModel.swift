
import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
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
}
