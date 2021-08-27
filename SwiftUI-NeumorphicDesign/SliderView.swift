//
//  SliderView.swift
//  SwiftUI-NeumorphicDesign
//
//  Created by Arpit Dixit on 27/08/21.
//

import SwiftUI

struct SliderView: View {
    
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        SwiftUISlider(
                thumbColor: UIColor(Color(#colorLiteral(red: 0.7474666238, green: 0.6354899406, blue: 0.86035043, alpha: 1))),
                minTrackColor: UIColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
                maxTrackColor: UIColor(Color(#colorLiteral(red: 0.7474666238, green: 0.6354899406, blue: 0.86035043, alpha: 1))),
                value: $sliderValue
              )
        .shadow(color: Color(#colorLiteral(red: 0.7474666238, green: 0.6354899406, blue: 0.86035043, alpha: 1)), radius: 6, x: 9.0, y: 9.0)
        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius:6, x: -9.0, y: -9.0)
        .padding(.horizontal)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}


struct SwiftUISlider: UIViewRepresentable {

  final class Coordinator: NSObject {
    // The class property value is a binding: It’s a reference to the SwiftUISlider
    // value, which receives a reference to a @State variable value in ContentView.
    var value: Binding<Double>

    // Create the binding when you initialize the Coordinator
    init(value: Binding<Double>) {
      self.value = value
    }

    // Create a valueChanged(_:) action
    @objc func valueChanged(_ sender: UISlider) {
      self.value.wrappedValue = Double(sender.value)
    }
  }

  var thumbColor: UIColor = .white
  var minTrackColor: UIColor?
  var maxTrackColor: UIColor?

  @Binding var value: Double

  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.thumbTintColor = thumbColor
    slider.minimumTrackTintColor = minTrackColor
    slider.maximumTrackTintColor = maxTrackColor
    slider.value = Float(value)

    slider.addTarget(
      context.coordinator,
      action: #selector(Coordinator.valueChanged(_:)),
      for: .valueChanged
    )

    return slider
  }

  func updateUIView(_ uiView: UISlider, context: Context) {
    // Coordinating data between UIView and SwiftUI view
    uiView.value = Float(self.value)
  }

  func makeCoordinator() -> SwiftUISlider.Coordinator {
    Coordinator(value: $value)
  }
}
