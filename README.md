# 완성도
## Keyword 검색 : ★★★★★
### 검색어 입력
ObservableObject로 Publish를 사용해서 
TextField의 값을 들고왔습니다.

### API 
API KEY와 URL을 사용해서 사용자가 입력한 검색어로
JSON 데이터를 들고올 수 있었습니다.

### AF
Alamofire로 서버에서 보내는 JSON 파일을 원하는 모델 형식으로
가져올 수 있었습니다.

## 검색된 아이템 목록 화면 : ★★★☆☆
### Image
AF로 들고온 데이터에서 url을 들고와 Image를 Load 했습니다.
Image로 데이터를 들고오려 했으나, DispatchQueue를 사용해 background로 이미지를 불러오고
main에서 UI를 불러오는 작업이 익숙하지 못했습니다. 
따라서 AsyncImage를 사용해 작업했습니다. 

### Gifs, Sticker Async Load
GIPHY Search 화면의 기능셋을 유사하게 구현하기 위해
Picker에 따라 Image Load가 Async하게 작동하는 것을 확인했습니다.
onChange를 사용해 Picker가 변화할 때마다 TextField에 있는 값과 Picker case를 사용해
새롭게 데이터를 가져와 갱신했습니다.

## 검색된 아이템 상세화면 : ★★☆☆☆
### Image Load 
Image List 에서 Image를 클릭했을 때 Detail View로 넘어갑니다.
이 때 클릭한 Item의 id 값도 매개변수로 전달했습니다. 
id 값을 통해서 ViewModel에서 id와 같은 값의 이미지를 불러와 Load 했습니다.

### 상세화면에서 Favorites On/Off 기능 구현
Local Data를 사용해서 Favorite 표시를 한 데이터는 따로 저장하려 했습니다.
또한 토글을 통해 변화하는 변수로 Local Data를 조작하려 했습니다. 
FileManager와 Local 데이터에 접근하는 부분이 익숙하지 못해 적용하지 못했습니다.

# 회고
1. SwiftUI의 @main은 iOS 14 이상에서만 호환되는 것을 알게되었습니다.
2. 비동기 작업을 활용하는 것이 부족하다고 느꼈습니다.
3. MVVM 구조를 더 연습해야겠다고 느꼈습니다.
4. Local Data를 활용하는 것이 부족하다고 느꼈습니다.
5. 애플에서 제공하는 프레임 워크 뿐만 아니라 다양한 API도 경험해보는 것이 좋을 것 같다고 생각했습니다. 

