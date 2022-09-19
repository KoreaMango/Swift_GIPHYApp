//
//  SearchViewModel.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject{
    // MARK: - ViewModel -> View
    /// TextField 로 실시간으로 바뀌는 변수
    @Published var searchTextField : String = ""
    
    /// API로 서버에서 들고온 데이터를 저장
    @Published var items = [ResponseData]()
    
    private var dataManager: ServiceProtocol
    
    private var cancellabls = Set<AnyCancellable>()
    
    init(dataManager: ServiceProtocol = DataManager.shared){
        self.dataManager = dataManager
    }
    
    // MARK: - API Function
    
    func getDataList(selection : gifOrSticker, limit : Int) {
        let data = dataManager.requestData(q: searchTextField, selection: selection)
        
        data
            .decode(type: ResponseDatas.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print ("Received completion: \($0).")
            },  receiveValue: {user in
                self.items = user.all ?? []
                print ("Received user: \(self.items).")
            })
            .store(in: &cancellabls)
    }

    
    // MARK: - Local Data Function
    /// favorite 가 되어있는지 확인하는 함수
    func haveFavorite(id : String) -> Bool {
        let result = DiskCache.shared.fetchData(id: id)
        
        print(DiskCache.shared.printObj())
        return result
        
    }
    
    /// Favorite 로 만들어주는 함수
    func onFavorite (id : String) {
        DiskCache.shared.addData(id: id, isFavorite: true)
        print(DiskCache.shared.printObj())
    }
    
    /// Favorite 를 취소하는 함수
    func offFavorite(id : String){
        DiskCache.shared.addData(id: id, isFavorite: false)
        print(DiskCache.shared.printObj())
    }
    
    /// ResponseData에서 URL만 추출하는 함수
    func getImageURL(item: ResponseData) -> URL?{
        if let url = item.images?.original.url{
            return URL(string: url)
        }
        return nil
    }
    
}
