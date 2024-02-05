
import SwiftUI

struct SettingsView: View {
    @State var viewModel = SettingsViewViewModel()
    @State private var isExpandedDropdownColor = false
    @Environment(\.colorScheme) var scheme
    
    private let colorOptions = ["light", "dark"]
    private let sortOptions = ["AZ", "ZA", "Random"]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Color Mode")
                .font(.footnote)
                .foregroundColor(.gray)
                .opacity(0.8)
            
            VStack {
                HStack{
                    if viewModel.selectedColorMode == "" {
                        Text("Select")
                    }
                    else {
                        Text(viewModel.selectedColorMode)
                    }
 
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(Angle(degrees: isExpandedDropdownColor ? -180 : 0))
                }
                .frame(height: 40)
                .background(scheme == .dark ? .black : .white)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy){
                        isExpandedDropdownColor.toggle()
                    }
                }
            
                if isExpandedDropdownColor {
                    VStack {
                        ForEach(colorOptions, id: \.self) { option in
                            HStack{
                                Text(option)
                                
                                Spacer()
                                
                                if viewModel.selectedColorMode == option {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy){
                                    viewModel.selectedSortMode = option
                                    isExpandedDropdownColor.toggle()
                                }
                            }
                        }
                        .transition(.move(edge: .bottom))
                    }
                }
            }
            .background(scheme == .dark ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .frame(width: 150)
        }
    }
}

#Preview {
    SettingsView()
}
