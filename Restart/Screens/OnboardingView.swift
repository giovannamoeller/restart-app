//
//  OnboardingView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct OnboardingView: View {
  
  private var buttonHeight: CGFloat = 80

  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

  @State private var buttonWidth: Double
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = false
  
  init() {
    buttonWidth = UIScreen.main.bounds.width - buttonHeight
  }
  
  var body: some View {
    ZStack {
      Color("ColorBlue").ignoresSafeArea()
      
      VStack(spacing: 20) {
        Spacer()
        
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
          
          Text("""
          It's not how much we give but
          how much love we put into giving.
          """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
          
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1.0), value: isAnimating)
        }
        
        Spacer()
        
        ZStack {
          Capsule()
            .fill(Color.white.opacity(0.2))
          
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)
          
          Text("Get Started")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + buttonHeight)
            
            Spacer()
          }
          
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: buttonHeight, height: buttonHeight, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged({ gesture in
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - buttonHeight {
                    withAnimation {
                      buttonOffset = gesture.translation.width
                    }
                  }
                })
                .onEnded({ _ in
                  if buttonOffset > buttonWidth / 2 {
                    withAnimation {
                      isOnboardingViewActive = false
                    }
                  } else {
                    withAnimation {
                      buttonOffset = 0
                    }
                  }
                })
            )
            
            Spacer()
          }
          
        }.frame(width: buttonWidth, height: buttonHeight, alignment: .center)
          .padding()
          .opacity(isAnimating ? 1 : 0)
          .offset(y: isAnimating ? 0 : 40)
          .animation(.easeOut(duration: 1), value: isAnimating)
      }.onAppear {
        isAnimating = true
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
