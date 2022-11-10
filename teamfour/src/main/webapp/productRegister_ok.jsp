<%@page import="com.teamfour.productAll.model.ProductAllService"%>
<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="com.util.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>


<%
	//write.jsp에서 post방식으로 서브밋됨
	
	//업로드할 경로
	/* String saveDir=application.getRealPath(Utility.UPLOAD_DIR);
	saveDir=config.getServletContext().getRealPath(Utility.UPLOAD_DIR);
	System.out.println("saveDir="+saveDir); */
	
	String saveDir=Utility.TEST_DIR;
	System.out.println("testDir="+saveDir);
			
	int maxSize=30*1024*1024; //업로드할 최대 용량, 30M
	
	try{
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		MultipartRequest mr
			=new MultipartRequest(request, saveDir, maxSize, "utf-8", policy);
		System.out.println("업로드 완료!");
		
		//업로드 파일 정보 구하기
		String fileName=mr.getFilesystemName("productImage");
		long fileSize=0;
		String originalFName="";
		if(fileName!=null){  //파일이 첨부된 경우만
			File file = mr.getFile("productImage");
			fileSize=file.length();
			
			originalFName=mr.getOriginalFileName("productImage");
		}
		
		//1
		String pdname = mr.getParameter("pdname");
		String price = mr.getParameter("price");
		String qty = mr.getParameter("qty");
		String productImage = mr.getParameter("productImage");
		String detail = mr.getParameter("detail");
		String seller_no = mr.getParameter("seller_no");
		
		String cloth = mr.getParameter("cloth");
		String food = mr.getParameter("food");
		String furniture = mr.getParameter("furniture");
		String electronics = mr.getParameter("electronics");
		String pet = mr.getParameter("pet");
		
		String div_no = "";
		
		if(!cloth.equals("empty")){
			div_no = cloth;
		}
		if(!food.equals("empty")){
			div_no = food;
		}
		if(!furniture.equals("empty")){
			div_no = furniture;
		}
		if(!electronics.equals("empty")){
			div_no = electronics;
		}
		if(!pet.equals("empty")){
			div_no = pet;
		}
		
		
		String ip = request.getRemoteAddr();
		System.out.println("ip="+ip);
		
		ip=request.getRemoteHost();
		System.out.println("ip="+ip);
		
		//2
		ProductAllVO vo = new ProductAllVO();
		ProductAllService service = new ProductAllService();
		
		vo.setPdname(pdname);
		vo.setPrice(Integer.parseInt(price));
		vo.setQty(Integer.parseInt(qty));
		vo.setSeller_no(Long.parseLong(seller_no));
		vo.setImage(fileName);
		vo.setDetail(detail);
		vo.setDiv_no(Integer.parseInt(div_no));
		
		
		int cnt=service.insertProductAll(vo);
		
		//3
		if(cnt>0){%>
			<script type="text/javascript">
				alert('상품이 등록되었습니다.');
				location.href="<%=request.getContextPath() %>/sellerDetail.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('상품 등록 실패!');
				history.back();
			</script>			
		<%}		
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){%>
		<script type="text/javascript">
			alert('30M 이상의 파일은 업로드할 수 없습니다!');
			history.back();
		</script>
	<%	e.printStackTrace();
	}
%>
</body>
</html>