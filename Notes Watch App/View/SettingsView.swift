//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Arthur Reshetnyak on 2024-05-03.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "gear")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                update()
            }), in: 1...4, step: 1)
            .foregroundColor(.accentColor)
        }
        .onAppear {
            value = Float(lineCount)
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
