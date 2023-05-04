//
//  ContentView.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import SwiftUI

struct PhotosListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosListView()
    }
}
