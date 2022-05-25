//
//  modePicker.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct modePicker: View {
    @Binding var selectCase : gifOrSticker
    var body: some View {
        Picker("", selection: $selectCase) {
            ForEach(pickerCase.allCases){ object in
                Text(object.rawValue.capitalized)
                    .tag(object.selectCase)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct modePicker_Previews: PreviewProvider {
    static var previews: some View {
        modePicker(selectCase: .constant(.GIFMode))
    }
}
