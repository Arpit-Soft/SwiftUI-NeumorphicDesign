//
//  MusicPlayerView.swift
//  SwiftUI-NeumorphicDesign
//
//  Created by Arpit Dixit on 27/08/21.
//

import SwiftUI

struct MusicPlayerView: View {
    
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            
            HStack {
                NeumorphicButton(systemName: "arrow.left", size: CGSize(width: 20, height: 20)) {}
                
                Spacer()
                
                Text("Playing now")
                
                Spacer()
                
                NeumorphicButton(systemName: "line.horizontal.3", size: CGSize(width: 20, height: 20)) {}
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
            
            ZStack {
                Image("art")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                    .shadow(color: Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)), radius: 6, x: 9.0, y: 9.0)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius:6, x: -9.0, y: -9.0)
            }
            .clipShape(Circle().inset(by: 6))
            .shadow(color: Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)), radius: 8, x: 9.0, y: 9.0)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9.0, y: -9.0)
            .offset(y: UIScreen.main.bounds.size.height/8)
            
            Spacer()
            
            SliderView()
                .padding()
            
            HStack {
                
                NeumorphicButton(systemName: "backward.fill", size: CGSize(width: 30, height: 30)) {}
                
                Spacer()
                
                NeumorphicButton(systemName: "stop.fill", size: CGSize(width: 40, height: 40)) {}
                
                Spacer()
                
                NeumorphicButton(systemName: "forward.fill", size: CGSize(width: 30, height: 30)) {}
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 40, trailing: 40))
        }
        .background(Color(#colorLiteral(red: 0.9403042197, green: 0.8512351513, blue: 0.9989826083, alpha: 1)))
        .edgesIgnoringSafeArea([.top, .bottom])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
