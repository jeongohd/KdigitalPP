package pp.pp.portfolio.omok;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ppomok")
public class PlayController {


	static final int SIZE = 17; // 배열 사이즈	
	
	// 이차원배열(boolean[SIZE][SIZE])을 값으로 가지는 Map.
	Map<Integer, boolean[][]> blackBoard = new HashMap<Integer, boolean[][]>();
	Map<Integer, boolean[][]> whiteBoard = new HashMap<Integer, boolean[][]>();
	
	@RequestMapping("/wait")
	public static String join(HttpServletRequest req) {
		return "ppomok/wait";
	}

	@PostMapping("/play")
	public String play(HttpServletRequest req) {
		
		boolean[][] black = new boolean[SIZE][SIZE]; // boolean 기본값인 false로 시작.
		boolean[][] white = new boolean[SIZE][SIZE];
		int oneGame = 1;
		req.setAttribute("oneGame", oneGame);
		
		// 각 맵에 oneGame을 키값으로 오목판을 저장.
		blackBoard.put(oneGame, black);	
		whiteBoard.put(oneGame, white);
		return "ppomok/play";	
	}

	// 화면 클릭시 돌이 그려지고 해당 좌표를 ajax를 통해 값을 받고 오목성공여부 리턴해줌. 
	@PostMapping("/omokcheck")
	public @ResponseBody boolean omokcheck(OmokDTO dto, @RequestParam boolean turn) {
		int x = dto.getX();
		int y = dto.getY();
		int oneGame = dto.getOneGame();
		boolean win; 
		// 각 돌에 맞는 오목판에 넘어온 좌표값을 바꿈 (false -> ture)
		if (turn) {		
			blackBoard.get(oneGame)[y][x] = true;  		
			win = Check.check(blackBoard.get(oneGame), y, x);  
		} else {
			whiteBoard.get(oneGame)[y][x] = true;
			win = Check.check(whiteBoard.get(oneGame), y, x);
		}
		return win;
	}
	
	@RequestMapping("/end")
	public void end() {}

}