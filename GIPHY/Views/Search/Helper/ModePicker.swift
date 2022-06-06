//
//  ModePicker.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct ModePicker: View {
    // MARK: - 변수
    // SearchList에서부터 받아온 ViewModel의 환경 변수
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    // 읽어오는 글의 수
    @Binding var limit : Int
    
    // Picker의 상태 변수
    @Binding var selectCase : gifOrSticker
    
    // MARK: - View
    var body: some View {
        // GIFs, Sticker을 선택하는 Picker
        Picker("", selection: $selectCase) {
            ForEach(pickerCase.allCases){ object in
                Text(object.rawValue.capitalized)
                    .tag(object.selectCase)
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: selectCase){ newValue in // Picker 가 변경되면 해당 case에 맞게 데이터를 다시 들고옴
            searchViewModel.getResult(selection: selectCase, limit: limit)
        }
    }
}

// MARK: - Previews
struct ModePicker_Previews: PreviewProvider {
    static var previews: some View {
        ModePicker(limit : .constant(25), selectCase: .constant(.GIFMode))
    }
}
