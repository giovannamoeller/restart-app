//
//  HomeView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct HomeView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  
  var body: some View {
    VStack {
      Spacer()
      
      ZStack {
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.15)
        
        Image("character-2")
           .resizable()
          .scaledToFit()
        .padding()
      }
      
      Text("The time that leads to mastery is dependent on the intensity of our focus.")
        .foregroundColor(.secondary)
        .font(.title3)
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()
      
      Spacer()
      
      Button {
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
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
