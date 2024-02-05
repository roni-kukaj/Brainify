
import SwiftUI

struct SettingsView: View {
    @State var viewModel = SettingsViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section {
                        Picker("Select Color Theme", selection: $viewModel.selectedColorMode){
                            ForEach(ColorModes.allCases, id: \.self) {mode in
                                Text("\(mode.rawValue)")
                            }
                        }
                    }
                    Section {
                        Picker("Select Deck Sort", selection: $viewModel.selectedSortMode, content: {
                            ForEach(SortModes.allCases, id: \.self) {mode in
                                Text("\(mode.rawValue)")
                            }
                        })
                    }
                    CustomButton(title:"Save Changes", background: Color(hex: "#78C1F3")){
                        viewModel.updateSettings()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    
    }
}

#Preview {
    SettingsView()
}
