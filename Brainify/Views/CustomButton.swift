//
//  CustomButton.swift
//  Brainify
//
//  Created by Roni Kukaj on 29.1.24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    CustomButton(title: "Value", background: .pink){
        
    }
}
