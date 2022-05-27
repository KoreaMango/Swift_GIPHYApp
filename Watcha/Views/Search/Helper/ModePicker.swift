//
//  ModePicker.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct ModePicker: View {
    // SearchList에서 받아온 ViewModel을 환경 변수로 이어 받음
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    // 읽어오는 글 수 Binidng
    @Binding var limit : Int
    
    // Picker의 상태 변수를 Binding
    @Binding var selectCase : gifOrSticker
    var body: some View {
        // Case에 따라서 바뀌는 Picker
        Picker("", selection: $selectCase) {
            ForEach(pickerCase.allCases){ object in
                Text(object.rawValue.capitalized)
                    .tag(object.selectCase)
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: selectCase){ newValue in
            searchViewModel.getResult(selection: selectCase, limit: limit)
        }
    }
}

struct ModePicker_Previews: PreviewProvider {
    static var previews: some View {
        ModePicker(limit : .constant(25), selectCase: .constant(.GIFMode))
    }
}
