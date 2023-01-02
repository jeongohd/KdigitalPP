var canvas;
var context;
var board;
var imageList = ["bg1.png","bg2.png","blackStone.png", "whiteStone.png", "mark.png"];
var imageArray = new Array(imageList.length); 
var imageLoadIndex = 0;
var imgXsize = 30;
var imgYsize = 30;
var stoneColor = true;
var who;
var preX;
var preY;

window.onload = function(){
	boardInit(); // 오목판 초기화.

	canvas = document.createElement( 'Canvas' )  
	canvas.width=510;
	canvas.height=510;
	context = canvas.getContext('2d'); 
	document.querySelector('#div').appendChild( canvas );  
	
	imageLoad(); // 사진 준비
	input();  // 돌 놓는 클릭 관련 함수
}

// 이미지 파일 준비.
function imageLoad(){
	imageArray[imageLoadIndex] = new Image();  // <img> 태그 생성
	imageArray[imageLoadIndex].src = "../resources/omok_img/" + imageList[imageLoadIndex];  // <img src=""> 저장
	imageArray[imageLoadIndex].onload = function() {
		if(imageLoadIndex < imageList.length - 1) {
			imageLoadIndex++;
			imageLoad();
		} else {
			draw(); // 5개의 이미지태그가 모두 담기면 호출.
		}
	}
}

// 오목판 그리기. 
function draw(){
	for(var x = 0; x < board[0].length; x++){
		for(var y = 0; y < board.length; y++){
			if(board[y][x] == 0) continue;  
			// drawImage(이미지, x좌표, y좌표) - 해당 좌표에 이미지 그리기
			context.drawImage(imageArray[board[y][x]], x*imgXsize, y*imgYsize); 
		}
	}
}

// 돌 놓는 클릭 관련 함수
function input(){
	canvas.onclick = function(event){
// 클릭한 해당좌표의 x축, y축을 구한 후, 
// 배열 인덱스 밖에 찍히거나, 1값이 아닌 경우(돌이 올라가 있는 경우)에 찍히면 클릭이벤트를 끝냅니다. 
		var x = parseInt(event.offsetX /imgXsize);   
		var y = parseInt(event.offsetY /imgYsize);
		if(x < 0 | x > 16 | y < 0 | y > 16) return;	
		if(board[y][x] != 1) return;    
// 마지막에 둔 돌 빨간색마크를 지우기 위해 오목판이미지와 돌 그림으로 덮습니다. 	
		context.drawImage(imageArray[1], preX*imgXsize, preY*imgYsize);
		context.drawImage(imageArray[stoneColor? 3:2], preX*imgXsize, preY*imgYsize);
		
		// 흑돌(맨 처음 돌)과 백돌을 나눈 후
		if(stoneColor) {
			board[y][x] = 2;	
			who="black";
		} else {
			board[y][x] = 3;
			who="white";
		} 
					
	// 클릭한 x ,y 좌표값을 그립니다.
	// imageArray[2] -> blackStone.png (흑돌)
	// imageArray[3] -> whiteStone.png (백돌)
	// imageArray[4] -> mark.png (마지막에 둔 돌 표시)
	context.drawImage(imageArray[board[y][x]], x*imgXsize, y*imgYsize);
	context.drawImage(imageArray[4], x*imgXsize, y*imgYsize);
	// data -> java파일로 보내 오목 체크          
	$.ajax({
		url: '/pp/ppomok/omokcheck',
		type: 'post',
		data: { "x": x,
					"y": y,
					"turn": stoneColor,
					"oneGame": oneGame
				},
		success: function(win) { 
			if(win){
				setTimeout(function() {
					alert(`${who} 승리`);
					location.href=`/pp/ppomok/end` 
				},300);
			}
		}
	});
	// 돌 색을 교체합니다.
	stoneColor = !stoneColor;    
	
	preX = x;     // 다음 클릭에서 돌 빨간테두리 지우기 위해 좌표 저장
	preY = y;
	}
}

function boardInit(){
	board = [
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	];
}
