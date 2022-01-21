let map;
let marker = []; // マーカーを複数表示させたいので、配列化
let infoWindow = []; // 吹き出しを複数表示させたいので、配列化
let markerData = gon.hotels; // コントローラーで定義したインスタンス変数を変数に代入

function member_map_index() {
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('member-map-index'), {
    center: { lat: 35.63676467540053, lng: 139.88400364602666 }, // 舞浜駅を中心に表示させている
    zoom: 12,
  });

  // 繰り返し処理でマーカーと吹き出しを複数表示させる
  for (var i = 0; i < markerData.length; i++) {
    // console.log(markerData[i]);

    let id = markerData[i]['id']

    // 各地点の緯度経度を算出
    let markerLatLng = new google.maps.LatLng({
      lat: markerData[i]['latitude'],
      lng: markerData[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });

    // 各地点の吹き出しを作成
    infoWindow[i] = new google.maps.InfoWindow({
      // 吹き出しの内容
      content: '<a href="/hotels/' + id + '">' + markerData[i]['hotel_name'] +'</a>'
    });

    // マーカーにクリックイベントを追加
    markerEvent(i);
  }
}

  // マーカーをクリックしたら吹き出しを表示
function markerEvent(i) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i]);
  });
}