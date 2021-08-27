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
    private var size: CGSize
    
    init(systemName: String, size: CGSize = CGSize(width: 60, height: 60), onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.size = size
        self.onTap = onTap
    }
    
    private var gray: Color { Color(#colorLiteral(red: 0.7474666238, green: 0.6354899406, blue: 0.86035043, alpha: 1)) }
    private var white: Color { Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) }
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                isPressed = false
                onTap()
            }
            
        }) {
            Image(systemName: systemName)
                .resizable()
                .frame(width: size.width, height: size.height, alignment: .center)
                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .background(Color(#colorLiteral(red: 0.9403042197, green: 0.8512351513, blue: 0.9989826083, alpha: 1)))
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
