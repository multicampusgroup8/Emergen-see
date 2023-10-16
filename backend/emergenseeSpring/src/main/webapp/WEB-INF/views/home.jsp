<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- mainPage.html -->

    <style>
        /* 페이지 중앙 콘텐츠 영역 스타일 */
        .main-content {
            margin: 20px auto;
            /* 상하 간격 20px, 좌우 중앙 정렬 */
            background-color: #fff;
            /* 콘텐츠 영역 배경색 */
            padding: 20px;
            /* 콘텐츠 영역 내부 패딩 */
            border: 1px solid #000;
            /* 콘텐츠 영역 테두리 */
            width: 800px;
            /* 콘텐츠 영역 너비 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            /* 콘텐츠 영역에 그림자 효과 */
        }

        /* 지도 섹션 스타일 */
        .map-section {
            width: 100%;
            /* 지도 섹션의 넓이를 최대로 설정 */
            height: auto;
            /* 지도 섹션의 높이 설정 */
            margin-bottom: 20px;
            /* 지도 섹션 아래의 여백 */
        }

        /* 정보 섹션 (지도, 게시글, 실시간 검색어 등)의 스타일 */
        .info-section {
            display: flex;
            /* Flexbox를 사용하여 내부 요소를 가로로 배치 */
            justify-content: space-around;
            /* 내부 요소 정렬 수정 */
            column-gap: 20px;
            /* Flexbox 항목들 사이의 간격 설정 */
        }

        /* 게시글 및 실시간 검색어 섹션의 공통 스타일 */
        .posts,
        .realtime-search {
            border: 1px solid #333;
            /* 섹션의 테두리 설정 */
            padding: 20px;
            /* 섹션 내부의 패딩 설정 (20px) */
        }

        /*각 섹션 크기 조절*/
        .posts {
            flex: 2;
        }

        .realtime-search {
            flex: 1;
        }

        /*실시간 검색어 내용 스타일*/
        ol>li {
            margin: 1px;
        }

        /* 최신 게시글 및 인기 게시글의 스타일 */
        .latest-posts,
        .popular-posts {
            padding: 0px 20px;
            border-radius: 5px;
            margin: 10px 0;
            margin-bottom: 0;
            /* 박스 하단 여백을 제거 */
            /* 박스 사이의 여백을 제거했습니다. */
        }

        /* 각 게시글 및 실시간 검색어 영역의 제목 스타일 */
        .latest-posts h3,
        .popular-posts h3,
        .realtime-search h3 {
            font-size: 2em;
            /* 제목 크기 설정 */
            border-bottom: 2px solid #000;
            /* 제목 아래의 테두리 설정 */
            padding-bottom: 10px;
            /* 제목 아래의 패딩 설정 */
        }
        /*게시글 부분 스타일*/
        .mainContainer {
            padding: 30px;
            margin-bottom: 70px;
        }

        #boardContainer {
            width: 100%;
            margin: 0 auto;
        }

        td:last-of-type {
            text-align: center;
        }

        #replyWrap {
            padding: 7px;
            border-bottom: 3px solid var(--mainDark);
        }

        .replyEdit {
            margin-top: 10px;
        }

        .boardListSmall {
            width: 100%;
            border-collapse: collapse;
        }

        .boardListSmall th,
        .boardListSmall td {
            border-bottom: 1px solid var(--mainDark);
            padding: 4px;
            margin: 2px;
        }

        .weather-section {
            margin-top: 10px;
            border: 1px solid #222224;
            padding: 5px 30px;
        }

        .alert {
            background-color: var(--mainLight);
            font-weight: bold;
            margin: 20px 0;
            padding: 10px;
            text-align: center;
            font-size: 20px;
        }
    </style>
    <main>
        <!-- 페이지의 주요 콘텐츠 -->
        <div class="main-content">
            <!-- 지도 섹션 -->
            <div class="map-section">
                <div id="map" style="width:100%;height:350px;">    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
                </div>
                <div class="weather-section">
                    <p class="alert">선택 위치 : 경기도 성남시 🧭</p>
                    <table class="table">
                        <tr style="border: none;">
                            <td style="font-size: 18px; border: none;">31.1℃ 체감(32.7℃)🌡</td>
                        </tr>
                        <trstyle="border: none;">
                            <td style="font-size: 18px; border: none;">어제보다 2℃ 높아요</td>
                            </tr>
                    </table>
                    <table class="table">
                        <tr>
                            <td>💧습도</td>
                            <td>🌬바람</td>
                            <td>🌂1시간 강수량</td>
                        </tr>
                        <tr>
                            <td>65%</td>
                            <td>남동 1.6 m/s</td>
                            <td>- mm</td>
                        </tr>
                    </table>
                    <p class="alert">⚠ 해당 지역은 현재 폭염 특보가 발령 중 ⚠</p>
                    <table class="table">
                        <tr>
                            <th colspan="3">최근 재난 정보 모음</th>
                        </tr>
                        <tr style="background-color: #e8e5e2;">
                            <td style="background-color: #e8e5e2">날짜</td>
                            <td style="background-color: #e8e5e2;">유형</td>
                            <td style="background-color: #e8e5e2;">심각도</td>
                        </tr>
                        <tr>
                            <td>9/5</td>
                            <td>폭염</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>9/6</td>
                            <td>폭염</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>9/7</td>
                            <td>폭염</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>9/8</td>
                            <td>폭염</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>9/9</td>
                            <td>폭염</td>
                            <td>3</td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- 게시글 및 실시간 검색어 섹션 -->
            <div class="info-section">
                <!-- 최신글 및 인기글 섹션 -->
                <div class="posts">
                    <div class="latest-posts">
                        <h3>최신글</h3>
                        <div class="boardListWrap" id="latestPostsList">
                            <table class="boardListSmall">
                                <colgroup>
                                    <col>
                                    <col style="width:14%">
                                    <col style="width:12%">
                                    <col style="width:10%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td>제목</td>
                                        <td>카테고리</td>
                                        <td>조회수</td>
                                        <td>추천</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="boardView.html"><span>[충청] </span>여긴 시원한데
                                                [<span>0</span>]</a></td>
                                        <td>폭염</td>
                                        <td>1</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td><a href="boardView.html"><span>[제주] </span>비 오는 거 보여드림
                                                [<span>0</span>]</a></td>
                                        <td>지역</td>
                                        <td>17</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td><a href="boardView.html"><span>[서울] </span>에어컨, 나의 사랑. 에어컨, 나의 빛. 에어컨, 나의
                                                어둠. 에어컨, 나의 삶.
                                                [<span>0</span>]</a></td>
                                        <td>지역</td>
                                        <td>24</td>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="popular-posts">
                        <h3>인기글</h3>
                        <div class="boardListWrap" id="popularPostsList">
                            <table class="boardListSmall">
                                <colgroup>
                                    <col>
                                    <col style="width:14%">
                                    <col style="width:12%">
                                    <col style="width:10%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td>제목</td>
                                        <td>카테고리</td>
                                        <td>조회수</td>
                                        <td>추천</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="boardView.html"><span>[경기] </span>날씨 실화냐
                                                [<span>10</span>]</a></td>
                                        <td>폭염</td>
                                        <td>174</td>
                                        <td>12</td>
                                    </tr>
                                    <tr>
                                        <td><a href="boardView.html">[제주] </span>다들 덥다 하는데 여긴 비옴ㅋㅋㅋㅋ
                                                [<span>8</span>]</a></td>
                                        <td>호우</td>
                                        <td>156</td>
                                        <td>9</td>
                                    </tr>
                                    <tr>
                                        <td><a href="boardView.html">[서울] </span>처서 지나면 시원해진다면서요ㅜㅠㅠㅠㅠ
                                                [<span>7</span>]</a></td>
                                        <td>폭염</td>
                                        <td>132</td>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 실시간 검색어 섹션 -->
                <div class="realtime-search">
                    <h3>실시간 검색어</h3>
                    <ol style="font-size: 20px;">
                        <li>폭염 - </li>
                        <li>폭염 경보 -</li>
                        <li>폭염 주의보 -</li>
                        <li>경보 지속 시간 ↑</li>
                        <li>온도 ↑</li>
                        <li>국지성 호우 ↑</li>
                        <li>오늘 날씨 ↓</li>
                        <li>일사병 ↓</li>
                        <li>윌리스 하빌랜드 캐리어 ↓</li>
                    </ol>
                </div>
            </div>
        </div>
    </main>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=609722ffda1d4f3e21f1ca72fae22f87&libraries=services"></script>
    <script>
 // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = '대피소';//document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
    </script>
   
</body>




</html>
