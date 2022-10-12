//
//  ContentView.swift
//  GeometryReader
//
//  Created by Jonni Akesson on 2022-10-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { i in
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getProcentage(geo: geo) * 40),
                                              axis: (x: 0, y: 1, z: 0))
                        
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    
    private func getProcentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        
        return Double(1 - (currentX / maxDistance))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
