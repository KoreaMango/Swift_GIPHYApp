//
//  ModePicker.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct ModePicker: View {
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
    }
}

struct ModePicker_Previews: PreviewProvider {
    static var previews: some View {
        ModePicker(selectCase: .constant(.GIFMode))
    }
}
