var gMap = null;
//マーカーオブジェクト
var gMarkerCenter = null;

function initMap() {
    //とりあえず、東京都庁を中心にする
    var lat = 35.6896342;
    var lng = 139.6921006999999;

    //座標を設定
    var myLatLng = new google.maps.LatLng(lat, lng)
    var mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    // マップオブジェクトの生成、マーカー生成
    gMap = new google.maps.Map(document.getElementById("map"), mapOptions);
    gMarkerCenter = drawMarkerCenterInit(myLatLng);
}

// InvalidValueError: initMap is not a functionの対応
window.onload = function () {
  initMap();
}

//マーカー生成関数
function drawMarkerCenterInit(pos) {
    var markerCenter = new google.maps.Marker({
        position: pos,
        map: gMap,
        draggable: true // ドラッグ可能にする
    });
    return markerCenter;
  }
//検索ボタンをクリックしたとき
$('#searchAddressBtn').click(function () {
  //Geocoderオブジェクト生成
  var geocoder = new google.maps.Geocoder();
  //住所のテキストボックスから住所取得
  var address = $('[name=address]').val();
  //住所検索実行  
  geocoder.geocode(
    {
      'address': address,
      'region': 'jp'//地域を日本に設定
    },
    function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {

        //取得した座標をマップに反映
        gMap.setCenter(results[0].geometry.location);
        //取得した座標をマーカーに反映
        var pos = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
        gMarkerCenter.setPosition(pos);

        //取得した座標をテキストボックスにセット

        $('#inputLat').val(pos.lat());
        $('#inputLng').val(pos.lng());

      } else {
        //失敗したとき
        alert('住所検索に失敗しました。<br>住所が正しいか確認してください');
    }
  
})
});