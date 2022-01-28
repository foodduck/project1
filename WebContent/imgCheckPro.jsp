<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*"  %>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="java.util.*" %>   
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String originalFile, uploadFile;
		try {  
			int maxSize = 1024*1024*10;
			
			//파일 경로를 수정하세요
			String saveDirectory = "C:\\kks\\jsp\\project1\\WebContent\\img";
			MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, "utf-8");
			//MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());	
			originalFile = multi.getOriginalFileName("p_pic");
			uploadFile = multi.getFilesystemName("p_pic");
				
		if(uploadFile==null) {
			out.println("<p>해당 이미지가 업로드 되지 못했습니다.</p>");
		} else {
			out.println("<p>해당 이미지가 업로드 되었습니다.</p>");
			out.println("<a href='javascript:apply(\""+"./img/"+uploadFile+"\")'>"+uploadFile+" [적용]</a>");
			out.println("<p>적용을 눌러야만 업로드된 이미지로 이미지를 사용할 수 있습니다.</p>");
%>
		<script>
		function apply(id){
			
			opener.document.pform.p_img.value=id;
			//opener.document.getElementById("p_img").src = id;
			//opener.document.joinform.p_img.readonly=true;
			opener.document.pform.imgck.value="yes";
			window.close();
		}
		</script>
<%			
		}
	} catch (Exception e) {
		System.out.println("파일 업로드가 실패되었습니다.");
		e.printStackTrace();
	}
%>