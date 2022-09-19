# 완성도 v2.0
## Keyword 검색 : ★★★★★
- URLComponent를 이용한 API 쿼리 작성으로 가독성 향상.
- Combine과 URLSession 으로 Data를 async하게 가져옴.

## 검색된 아이템 목록 화면 : ★★★★☆
- app target 14로 낮춰서 AsyncImage를 사용할 수 없게 됨.
- Combine을 사용한 ImageLoader를 만들어 async imageView를 만들어 표시
- gif(이미지), sticker를 picker로 async하게 적용. 


## 검색된 아이템 상세화면 : ★★★★★
- Combine으로 image를 async load 함.
- DiskCache를 사용해 local에 Favorite 상태를 저장함.


# 회고 v2.0
1. Combine으로 Publisher를 조작하는 방법을 배웠습니다.
2. POP(protocol oriented programming)를 적용해보고 배웠습니다.
3. URL을 간결하게 정리하는 법을 배웠습니다.
4. URLSession이 Combine과 사용하기 편리하다는 점을 느꼈습니다. 
5. Userdefaults를 사용해 Local에 값 저장하는 법을 배웠습니다.

# 회고(구) v1.0
1. SwiftUI의 @main은 iOS 14 이상에서만 호환되는 것을 알게되었습니다.
2. 비동기 작업을 활용하는 것이 부족하다고 느꼈습니다.
3. MVVM 구조를 더 연습해야겠다고 느꼈습니다.
4. Local Data를 활용하는 것이 부족하다고 느꼈습니다.
5. 애플에서 제공하는 프레임 워크 뿐만 아니라 다양한 API도 경험해보는 것이 좋을 것 같다고 생각했습니다. 


