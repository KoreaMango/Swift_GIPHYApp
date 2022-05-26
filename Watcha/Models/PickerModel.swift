//
//  PickerModel.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

// GIF, Sticker 검색 Picker
enum pickerCase: String, CaseIterable, Identifiable{
    case GIFs , Stickers
    var id: Self {self}
    var selectCase: gifOrSticker {
        switch self {
        case .GIFs: return .GIFMode
        case .Stickers: return .StickerMode
        }
    }
}

enum gifOrSticker: String, CaseIterable, Identifiable {
    case GIFMode, StickerMode
    var id: Self { self }
}
