//
//  ContentView.swift
//  InstaFilter
//
//  Created by Sai Abhilash Gudavalli on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    
                    Button("Change filter") {
                        // change filter
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                    
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in
                loadImage()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func save() {
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
