
import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewViewModel()
    
    private let colorOptions = ["light", "dark"]
    private let sortOptions = ["AZ", "ZA", "Random"]
    
    var body: some View {
        NavigationView {
            VStack {
                CustomDropdownView(title: "Color Mode", prompt: "Select", options: colorOptions, selection: $viewModel.selectedColorMode)
                    .padding(.bottom, 20)
                
                CustomDropdownView(title: "Sorting Method", prompt: "Select", options: sortOptions, selection: $viewModel.selectedSortMode)
                    .padding(.bottom, 20)
                
                Button {
                    viewModel.updateSettings()
                    viewModel.showAlert = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        Text("Save Settings")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 200, height: 40)
                }
            }
            .navigationTitle("Settings")
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Success"),
                      message: Text("Your settings have been updated!"))
            }
        }
    }
}

#Preview {
    SettingsView()
}
