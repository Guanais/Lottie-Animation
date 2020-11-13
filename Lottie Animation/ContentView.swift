//
//  ContentView.swift
//  Lottie Animation
//
//  Created by Kaio Guanais on 2020-11-05.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct Home: View {
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: CartPage(),
                label: {
                    Label(
                        title: {
                            Text("Go To Cart Page")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary )
                        },
                        icon: {
                            Image(systemName: "cart")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color.red)
                        })
                })
                .navigationTitle("Home")
        }
    }
}

struct CartPage: View {
    @State var black = Color.primary.opacity(0.7)
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {present.wrappedValue.dismiss()}, label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(.primary)
                })
                Spacer()
            }
            .padding()
            
            LottieView(animationName: "emptycart")
                .frame(height: UIScreen.main.bounds.height / 2)
            
            Text("Your cart is empty")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            
            Text("Load up the basket")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 5)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Text("Start shopping")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(Color.red)
                .cornerRadius(4)
        }
        .navigationBarHidden(true)
    }
}

struct LottieView: UIViewRepresentable {
    var animationName: String
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: animationName, bundle: Bundle.main)
        view.loopMode = .loop
        view.play()
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
