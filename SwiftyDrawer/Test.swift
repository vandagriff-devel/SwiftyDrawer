//
//  Test.swift
//  SwiftyDrawer
//
//  Created by Keith Vandagriff on 5/22/24.
//

import SwiftUI

struct Test: View {
    @State var active: Bool = false
    @State var randomNumber: Int = 0
    
    var body: some View {
        SwiftyDrawer(
            isActive: $active,
            size: .large,
            blurAmount: 3
        ) {
            ZStack(alignment: .center) {
                Color.clear
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Random number: \(randomNumber)")
                    Button("Generate") {
                        randomNumber = Int.random(in: 0...100)
                    }
                    Spacer()
                    Button("drawer") {
                        active.toggle()
                    }
                    .buttonStyle(.bordered)
                }
            }
        } drawerContent: {
            VStack {
                ForEach(0..<5) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red.tertiary)
                        .frame(height: 50)
                        
                }
            }
            .padding()
        }

    }
}

#Preview {
    Test()
}
