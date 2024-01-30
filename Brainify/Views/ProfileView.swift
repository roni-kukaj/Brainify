
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                    .padding()

                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text("")
                    }
                    .padding()
                    HStack {
                        Text("Email: ")
                        Text("")
                    }
                    .padding()
                }
                Button("Log Out") {
                    viewModel.logOut()
                }
                .tint(.red)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
