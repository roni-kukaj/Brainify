
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "Log In",
                       subtitle: "Continue your journey!",
                       angle: 15,
                       background: Color(hex: "#78C1F3"))
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled(true)
                    
                    CustomButton(title: "Log In", background: .green) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                Spacer()
                
                VStack{
                    Text("Don't have an account?")
                    NavigationLink("Create one here", destination: RegisterView())
                }
            }
        }
        
    }
}

#Preview {
    LoginView()
}
