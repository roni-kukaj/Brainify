
import SwiftUI


struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            if let user = viewModel.user {
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
                                .bold()
                            Text("\(user.name)")
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text("\(user.email)")
                        }
                        .padding()
                        HStack {
                            Text("Member Since:")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .padding()
                    .tint(.red)
                }
                .navigationTitle("Profile")
            }
            else {
                Text("Loading User...")
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
