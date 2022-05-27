//
//  FavoriteButton.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/27.
//

import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorite : Bool = false
    @EnvironmentObject var searchViewModel : SearchViewModel
    
    var id : String
    
    var body: some View {
        VStack{
            Toggle ("Favorite", isOn: $isFavorite)
                .onChange(of: isFavorite){ isOn in
                    
                    // 토글이 On으로 바뀐다면
                    if isOn {
                        // 로컬에 데이터를 저장한다.
                        saveData()
                    }
                    
                    // 토글이 Off 로 바뀐다면
                    else{
                        // 로컬에 데이터를 삭제한다.
                        deleteData()
                    }
                    
                }
                .padding()
        }.onAppear{
            // 화면이 나타날 때 로컬 데이터에 해당 이미지의 id 값이 있는지 확인한다.
            if isFavoriteData() {
                isFavorite = true
            } else {
                isFavorite = false
            }
        }
        
    }
    
    func isFavoriteData() -> Bool{
        // 로컬의 데이터를 들고온다.
        // 현재 DetailView에 있는 Image의 ID 값을 로컬 데이터에서 검색한다.
        
            // 검색이 되면 좋아요가 눌러진 상태
                // true를 return 한다.
            // 검색이 안되면 좋아요가 안눌러진 상태
                // false를 return 한다.
        
        return true
    }
    
    func saveData () {
        // 현재 Detail View의 Image의 Id 값을 사용해서 ReponseData 타입으로 로컬 JSON에 저장한다.
    }
    
    func deleteData(){
        // 현재 Detail View의 Image의 Id 값을 사용해서 Index 값을 찾는다.
        
        // Index 값을 사용해서 데이터를 삭제한다.
    }

}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(id: "")
    }
}
