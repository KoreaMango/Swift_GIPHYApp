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
    @Published var items = [ResponseDatas]()
    
    private var dataManager: ServiceProtocol
    private var cancellabls = Set<AnyCancellable>()
    
    init(dataManager: ServiceProtocol = APIManager.shared){
        self.dataManager = dataManager
    }
    
    // MARK: - API Function
    
    func getDataList(selection : gifOrSticker, limit : Int) {
        let data = dataManager.request(q: searchTextField, selection: selection)
        
        data
            .decode(type: ResponseDatas.self, decoder: JSONDecoder())
            .sink(receiveCompletion: {
                print ("Received completion: \($0).")
            },  receiveValue: {user in
                print ("Received user: \(user).")
            })
            .store(in: &cancellabls)
    }
    
    func itemsInit (){
        self.items = []
    }
    
    // MARK: - Local Data Function
    func isFavoriteData(id : String) -> Bool{
        // 로컬의 데이터를 들고온다.
        // 현재 DetailView에 있는 Image의 ID 값을 로컬 데이터에서 검색한다.
        
            // 검색이 되면 좋아요가 눌러진 상태
                // true를 return 한다.
            // 검색이 안되면 좋아요가 안눌러진 상태
                // false를 return 한다.
        
        /// 임의 값
        return true
    }
    
    func saveData (id : String) {
        // 현재 Detail View의 Image의 Id 값을 사용해서 ReponseData 타입으로 로컬 JSON에 저장한다.
    }
    
    func deleteData(id : String){
        // 현재 Detail View의 Image의 Id 값을 사용해서 Index 값을 찾는다.
        
        // Index 값을 사용해서 데이터를 삭제한다.
    }
    
    /// ResponseData에서 URL만 추출하는 함수
    func getImageURL(item: ResponseData) -> URL?{
        if let url = item.images?.original.url{
            return URL(string: url)
        }
        return nil
    }
    
}
