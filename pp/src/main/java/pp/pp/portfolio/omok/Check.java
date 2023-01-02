package pp.pp.portfolio.omok;

public class Check{
    static int SIZE = PlayController.SIZE-1;
	static int count;
    static int _r;
    static int _c;
	
	public static boolean check(boolean[][] a, int r, int c) {
		// 마지막에 둔 돌 기준으로 ㅡ, |,  \, / 체크
		if(rowCheck(a,r,c) || colCheck(a,r,c) || dia1Check(a,r,c) || dia2check(a,r,c)) {
			return true;
		}else return false;
	}
	
	private static boolean dia1Check(boolean[][] a, int r, int c) {
		_r = r;		// 마지막에 둔 돌 행값 저장.
		_c = c;		// 마지막에 둔 돌 열값 저장.
		count = 1; 	// 마지막에 둔 돌 1개부터 돌 카운트
		
		//  ↖ 방향 체크
		while(c>0 && r>0 && a[--r][--c]) {
			count++;
		}
		//  ↘ 방향 체크
		while(_c<SIZE && _r<SIZE && a[++_r][++_c] ) {
			count++;
		}
		
		if(count == 5) return true;
		else return false;
	}
	
	private static boolean dia2check(boolean[][] a, int r, int c) {
		_r = r;		// 마지막에 둔 돌 행값 저장.
		_c = c;		// 마지막에 둔 돌 열값 저장.
		count = 1;  // 마지막에 둔 돌 1개부터 돌 카운트
		
		// ↙ 방향 체크
		while(c>0 && r<SIZE && a[++r][--c]) {
			count++;
		}
		// ↗ 방향 체크
		while(_c<SIZE && _r>0 && a[--_r][++_c] ) {
			count++;
		}
		
		if(count == 5) return true;
		else return false;
	}
	
	private static boolean colCheck(boolean[][] a, int r, int c) {
		_r = r; 	// 마지막에 둔 돌의 행값 저장.
		count = 1; 	// 마지막에 둔 돌 1개부터 돌 카운트
		
		// ↑ 방향 체크
		while(r>0 && a[--r][c]) {  
			count++;
		}
		// ↓ 방향 체크
		while(_r<SIZE && a[++_r][c] ) { 
			count++;
		}
		
		if(count == 5) return true;
		else return false;
	}
	
	private static boolean rowCheck(boolean[][] a, int r, int c) {
		_c = c; 	// 마지막에 둔의 돌 열값 저장.
		count = 1; 	// 마지막에 둔 돌 1개부터 돌 카운트
		
		//   ←  방향 체크
		while(c>0 && a[r][--c]) {
			count++;
		}
		//  → 방향 체크
		while(_c<SIZE && a[r][++_c] ) {
			count++;
		}
		
		if(count == 5) return true;
		else return false;
	}
	
}