<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/upload"); //실제 파일이 저장된 경로
	String saveFilename = request.getParameter("sName"); //실제 서버에 저장된 파일명
	String originalFilename = request.getParameter("oName"); // 사용자가 첨부한 원본파일
	
	try{
		File file = new File(saveDirectory, saveFilename); //경로와 서버의 파일명으로 file객체 생성
		InputStream inStream = new FileInputStream(file); //입력스트림객체 생성
		
		String client = request.getHeader("User-Agent"); //시용자의 브라우저 정보
		if(client.indexOf("WOW64") == -1){ //wow64문자열이 포함 안된경우 -->IE제외 브라우저
			originalFilename = new String(originalFilename.getBytes("UTF-8"),"ISO-8859-1");
		}else{
			originalFilename = new String(originalFilename.getBytes("KSC5601"),"ISO-8859-1");
		}
		
		//브라우저 헤더정보 저장 ,다운로드를 되게 불러오는? 주소를 속인느
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename+"\"");
		response.setHeader("Content-Length","" +file.length());
		
		out.clear();
		
		//출력스트림 객체 생성 ,다운로드
		OutputStream outStream = response.getOutputStream();
		
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer=inStream.read(b))>0){
			outStream.write(b,0,readBuffer);
		}
		
		inStream.close();
		outStream.close();
	}
	catch(FileNotFoundException e){
		System.out.println("파일을 찾을 수 없습니다.");
	}
	catch(Exception e){
		System.out.println("예외가 발생하였습니다.");
		e.printStackTrace();
	}
%>