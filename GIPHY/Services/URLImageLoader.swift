//
//  URLImageLoader.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/15.
//

import Foundation
import SwiftUI
import Combine

class URLImageLoader : ObservableObject{
    @Published var image : UIImage?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetch(url: URL?) {
        guard let url = url else {return}
        DataManager.shared.requestImage(url: url)
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("success")
                }
            } receiveValue: { [weak self] data in
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach{ $0.cancel() }
    }
}
