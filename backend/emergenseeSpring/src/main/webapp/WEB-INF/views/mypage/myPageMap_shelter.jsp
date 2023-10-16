<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"> </script>
 <style>
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            justify-content: space-between;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group label {
            flex: 1;
            margin-right: 20px;
        }

        .form-group input {
            flex: 2;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #E8E5E2;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .wrap {
            position: absolute;
            left: 0;
            bottom: 40px;
            width: 288px;
            height: 132px;
            margin-left: -144px;
            text-align: left;
            overflow: hidden;
            font-size: 12px;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            line-height: 1.5;
        }

        .wrap * {
            padding: 0;
            margin: 0;
        }

        .wrap .info {
            width: 286px;
            height: 120px;
            border-radius: 5px;
            border-bottom: 2px solid #ccc;
            border-right: 1px solid #ccc;
            overflow: hidden;
            background: #fff;
        }

        .wrap .info:nth-child(1) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .info .title {
            padding: 5px 0 0 10px;
            height: 30px;
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-size: 18px;
            font-weight: bold;
        }

        .info .close {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #888;
            width: 17px;
            height: 17px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
        }

        .info .close:hover {
            cursor: pointer;
        }

        .info .body {
            position: relative;
            overflow: hidden;
        }

        .info .desc {
            position: relative;
            margin: 13px 0 0 90px;
            height: 75px;
        }

        .desc .ellipsis {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .desc .jibun {
            font-size: 11px;
            color: #888;
            margin-top: -2px;
        }

        .info .img {
            position: absolute;
            top: 6px;
            left: 5px;
            width: 73px;
            height: 71px;
            border: 1px solid #ddd;
            color: #888;
            overflow: hidden;
        }

        .info:after {
            content: '';
            position: absolute;
            margin-left: -12px;
            left: 50%;
            bottom: 0;
            width: 22px;
            height: 12px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
        }

        .info .link {
            color: #5085BB;
        }

    </style>

            <!-- 메인 컨텐츠 -->
            <main>
                <h1>대피소 표시</h1>
                <div class="form-container">                    
                <div id="map" style="width:100%;height:350px;"></div>
                
                <table id="table">
                    <thead>
                        <tr>
                            <th>대피소 이름</th>
                            <th>위치</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>분당 OO 대피소</td>
                            <td>경기도 성남시 분당구 정자일로213번길 18</td>
                        </tr>
                        <tr>
                            <td>성남 OO 대피소</td>
                            <td>경기도 성남시 수정구 수정로 283</td>
                        </tr>
                        <!-- 필요한 만큼 추가 -->
                    </tbody>
                </table>
            </div>
            </main>
        </div>
    </div>

<script>
        var map = L.map('map').setView([37.5665, 126.9780], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        L.marker([37.5665, 126.9780]).addTo(map)
            .bindPopup('서울시청')
            .openPopup();
        
    </script>
    <!--
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23bee51da0d0811f6f8880e96e9de62c"></script>
    <script>
        // 지도를 생성합니다
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 (임시로 서울시청 좌표로 설정했습니다)
            level: 3 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(container, options);
        var overlays = [];  // 오버레이를 저장할 배열
        // 1. AJAX 호출을 통한 백엔드 정보 가져오기
        fetch('/path/to/backend/data') // 백엔드 API 엔드포인트로 수정
            .then(response => response.json())
            .then(data => {
                // 2. 받아온 데이터 파싱
                // 이 예시에서는 백엔드에서 바로 사용할 수 있는 형태의 JSON을 전송한다고 가정합니다.

                // 3. 파싱한 데이터를 통한 마커 및 오버레이 생성
                for (let item of data) {
                    // 마커 생성
                    let markerPosition = new kakao.maps.LatLng(item.lat, item.lng);
                    let marker = new kakao.maps.Marker({
                        position: markerPosition,
                        title: item.title
                    });
                    marker.setMap(map);

                    // 오버레이 생성
                    let content = `
                <div class="wrap">
                    <div class="info">
                        <div class="title">
                            ${item.title}
                            <div class="close" onclick="closeOverlay()" title="닫기"></div>
                        </div>
                        <div class="body">
                            <div class="img">
                                <img src="${item.imgURL}" width="73" height="70">
                            </div>
                            <div class="desc">
                                <div class="ellipsis">${item.address}</div>
                                <div class="jibun ellipsis">${item.additionalInfo}</div>
                                <div><a href="${item.link}" target="_blank" class="link">홈페이지</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            `;

                    let overlay = new kakao.maps.CustomOverlay({
                        content: content,
                        position: markerPosition
                    });

                    overlays.push(overlay);  // 오버레이를 배열에 추가

                    kakao.maps.event.addListener(marker, 'click', function () {
                        overlay.setMap(map);
                    });
                }
            })
            .catch(error => {
                console.error('Error fetching data from backend:', error);
            });

        function closeOverlay() {
            overlays.forEach(o => o.setMap(null));  // 모든 오버레이를 지도에서 제거
        }
    </script>
-->