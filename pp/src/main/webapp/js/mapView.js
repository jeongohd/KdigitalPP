// ^^ map.js를 앞에 넣어야함.
// ^^ 들어오자마자 코스 마커랑 직선 지도위에 올리기

//^^ 코스에 담은거 마커로 지도에 표시
function displayCouses(places) {

	var placePosition = new kakao.maps.LatLng(places[0].y, places[0].x);

	// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
	markerLine = new kakao.maps.Polyline({
		map : map, // 선을 표시할 지도입니다 
		path : [ placePosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		strokeWeight : 3, // 선의 두께입니다 
		strokeColor : '#db4040', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid' // 선의 스타일입니다
	});

	var bounds = new kakao.maps.LatLngBounds();

	for (var i = 0; i < places.length; i++) {

		// 마커를 생성하고 지도에 표시합니다
		placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
		var marker = addMarker(placePosition, i);

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);

		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		(function(marker, place) {
			kakao.maps.event.addListener(marker, 'mouseover',
				function() {
					displayInfowindow(marker, place.place_name);
				}
			);

			kakao.maps.event.addListener(marker, 'mouseout',
				function() {
					infowindow.close();
				}
			);

		})(marker, places[i]);

		// 그려지고 있는 선의 좌표 배열을 얻어옵니다
		var path = markerLine.getPath();

		// 좌표 배열에 클릭한 위치를 추가합니다
		path.push(placePosition);

		// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		markerLine.setPath(path);

		var distance = Math.round(markerLine.getLength());
		displayCircleDot(placePosition, distance);

	}

	showInfoDistance();

	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	map.setBounds(bounds);
}



