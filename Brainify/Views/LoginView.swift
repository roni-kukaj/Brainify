
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        VStack {
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
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
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
        }

        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }

            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled(true)
            
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
    }
}

#Preview {
    LoginView()
}
