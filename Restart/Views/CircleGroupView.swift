//
//  CircleGroupView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct CircleGroupView: View {
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  @State private var isAnimating: Bool = false
  
  var body: some View {
    
    ZStack {
      
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 260)
      
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 260)
      
    }.blur(radius: isAnimating ? 0 : 10)
      .opacity(isAnimating ? 1 : 0)
      .scaleEffect(isAnimating ? 1 : 0.5)
      .animation(.easeOut(duration: 1).repeatForever(), value: isAnimating)
      .onAppear {
        isAnimating = true
      }
  }
}

struct CircleGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color("ColorBlue").ignoresSafeArea()
      CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
  }
}
