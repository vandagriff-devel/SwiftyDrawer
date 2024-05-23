//
//  SwiftyDrawer.swift
//  SwiftyDrawer
//
//  Created by Keith Vandagriff on 5/21/24.
//

import SwiftUI

public struct SwiftyDrawer<Content: View, DrawerContent: View>: View {
    @Binding var isActive: Bool
    var size: DrawerSize = .regular
    var blurAmount: CGFloat = 3
    var cornerRadius: CGFloat = 20
    @State var dragOffset: CGFloat = 0
    @ViewBuilder let content: Content
    @ViewBuilder let drawerContent: DrawerContent
    
    public var body: some View {
        content
            .contentShape(Rectangle())
            .blur(radius: isActive ? blurAmount : 0)
            .onTapGesture {
                if isActive {
                    isActive = false
                }
            }
            .overlay(alignment: .trailing) {
                if isActive {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.ultraThinMaterial)
                        .frame(width: UIScreen.main.bounds.width * size.factor)
                        .padding(.horizontal)
                        .transition(.move(edge: .trailing))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.dragOffset = value.translation.width
                                }
                                .onEnded { value in
                                    if value.translation.width > 75.0 {
                                        self.isActive = false
                                    }
                                    self.dragOffset = .zero
                                }
                        )
                        .overlay(alignment: .top) {
                            VStack {
                                drawerContent
                                Text("\(dragOffset)")
                            }
                        }
                        .offset(x: dragOffset, y: 0)
                }
            }
            .animation(.spring(), value: isActive)
    }
}

//#Preview {
//    SwiftyDrawer {
//        Color.blue
//    } drawerContent: {
//        Text("drawer content")
//    }
//}
