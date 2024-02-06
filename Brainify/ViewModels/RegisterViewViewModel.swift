
import FirebaseFirestore
import FirebaseAuth
import Foundation
import FirebaseFirestoreSwift

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    @FirestoreQuery var users: [User]
    
    init() {
        self._users = FirestoreQuery(collectionPath: "users")
    }
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorMessage = "Please fill in all the fields."
                return false
            }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match!"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Your password cannot be shorter than 6 chacaters!"
            return false
        }
        guard doesUserExist(email: email) else {
            errorMessage = "A user with this email exists!"
            return false
        }
        return true
    }
    
    private func doesUserExist(email: String) -> Bool {
        for user in self.users {
            if user.email == email{
                return true
            }
        }
        return false
    }

}

