//
//  URLImageView.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/15.
//

import SwiftUI
import Combine

struct URLImageView: View {
    @StateObject private var imageLoader = URLImageLoader()
    
    private let url: URL?
    
    init(url: URL?){
        self.url = url
    }
    
    var body: some View {
        content
            .onAppear{
                imageLoader.fetch(url: url)
            }
    }
    
    private var content: some View {
        Group{
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading...")
            }
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: nil)
    }
}
