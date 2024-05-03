//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Arthur Reshetnyak on 2024-05-03.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    
    @State private var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                ScrollView(.vertical, showsIndicators: true) {
                    if !note.text.isEmpty {
                        Text(note.text)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("No content available")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
                
                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                    .frame(height: 50)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(count)/\(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "Hello, World!"), count: 0, index: 0)
    }
}
