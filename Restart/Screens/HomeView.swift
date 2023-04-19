//
//  HomeView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct HomeView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @State private var isAnimating: Bool = false
  
  var body: some View {
    VStack {
      Spacer()
      
      ZStack {
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.15)
        
        Image("character-2")
           .resizable()
           .scaledToFit()
           .padding()
           .offset(y: isAnimating ? 35 : -35)
           .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
      }
      
      Text("The time that leads to mastery is dependent on the intensity of our focus.")
        .foregroundColor(.secondary)
        .font(.title3)
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: isAnimating)
      
      Spacer()
      
      Button {
        playSound(sound: "success", type: "m4a")
        isOnboardingViewActive = true
      } label: {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .foregroundColor(.white)
            .imageScale(.large)
        
          Text("Restart")
            .foregroundColor(.white)
            .font(.title2)
            .bold()
      }.buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }.onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
        isAnimating = true
      })
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
