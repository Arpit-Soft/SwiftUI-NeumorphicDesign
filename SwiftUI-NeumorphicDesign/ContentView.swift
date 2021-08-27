//
//  ContentView.swift
//  SwiftUI-NeumorphicDesign
//
//  Created by Arpit Dixit on 27/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NeumorphicButton(systemName: "heart.fill") {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
