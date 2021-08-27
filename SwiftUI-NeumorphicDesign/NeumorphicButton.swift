//
//  NeumorphicButton.swift
//  SwiftUI-NeumorphicDesign
//
//  Created by Arpit Dixit on 27/08/21.
//

import SwiftUI

struct NeumorphicButton: View {
    
    @State private var isPressed = false
    
    private var systemName: String
    private var onTap: () -> Void
    
    init(systemName: String, onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.onTap = onTap
    }
    
    private var gray: Color { Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)) }
    private var white: Color { Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) }
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                isPressed = false
                onTap()
            }
            
        }) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .padding(30)
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        }
        .clipShape(Circle())
        .shadow(color: isPressed ? white :  gray, radius: isPressed ? 5 : 10, x: 8.0, y: 8.0)
        .shadow(color: isPressed ?  gray : white, radius: isPressed ? 5 : 10, x: -8.0, y: -8.0)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring())
    }
}

struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicButton(systemName: "heart.fill") {}
    }
}
