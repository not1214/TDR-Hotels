let admin_map;
let admin_marker = []; // マーカーを複数表示させたいので、配列化
let admin_infoWindow = []; // 吹き出しを複数表示させたいので、配列化
let admin_markerData = gon.hotels; // コントローラーで定義したインスタンス変数を変数に代入

function admin_map_index() {
  geocoder = new google.maps.Geocoder()

  admin_map = new google.maps.Map(document.getElementById('admin-map-index'), {
    center: { lat: 35.63676467540053, lng: 139.88400364602666 }, // 舞浜駅を中心に表示させている
    zoom: 12,
  });

  // 繰り返し処理でマーカーと吹き出しを複数表示させる
  for (var i = 0; i < admin_markerData.length; i++) {
    // console.log(markerData[i]);

    let id = admin_markerData[i]['id']

    // 各地点の緯度経度を算出
    let markerLatLng = new google.maps.LatLng({
      lat: admin_markerData[i]['latitude'],
      lng: admin_markerData[i]['longitude']
    });

    // 各地点のマーカーを作成
    admin_marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: admin_map
    });

    // 各地点の吹き出しを作成
    admin_infoWindow[i] = new google.maps.InfoWindow({
      // 吹き出しの内容
      content: '<a href="/admin/hotels/' + id + '">' + admin_markerData[i]['hotel_name'] +'</a>'
    });

    // マーカーにクリックイベントを追加
    admin_markerEvent(i);
  }
}

// マーカーをクリックしたら吹き出しを表示
function admin_markerEvent(i) {
  admin_marker[i].addListener('click', function () {
    admin_infoWindow[i].open(admin_map, admin_marker[i]);
  });
}