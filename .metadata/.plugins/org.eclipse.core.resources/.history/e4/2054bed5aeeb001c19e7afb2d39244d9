<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
<%@ page import="review.Review" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<jsp:useBean id="reserve" class="reserve.Reserve" scope="page" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/promotion.css">
    <link rel="stylesheet" href="css/article.css">
    <link rel="stylesheet" href="css/room-info.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/floating.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css">
    <link rel="stylesheet" href="css/planner.css">
    <link rel="shortcut icon" href="images/favicon.png"  type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Document</title>
</head>
<body>
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String) session.getAttribute("ID");
		}
		int postID = 0;
		if (request.getParameter("postID") != null){
			postID = Integer.parseInt(request.getParameter("postID"));
		}
		if (postID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.getPostDetail(postID);
		String titleMain = "images/mainImage/" + postID + ".jpg";
		String scoreText = Double.toString(Math.round(post.getSCORE() * 10) / 10.0);
		String score = "0"; //별점이 없을 경우, 0점으로 초기화
		String postContents = post.getPOST_CONTENTS().replace("\r\n", "<br>");
		String postDate = post.getPOST_DATE().substring(0, 10);
		
		if (scoreText != null) { //별점이 있는 경우, 별점 배정
			score = scoreText;
		}
	%>
    <div class="floating">
        <a href="/"><div class="topBtn">
            <i class="ri-arrow-up-s-line"></i>
        </div></a>
    </div>
    <header>
        <nav>
            <a href="searchmain.jsp" class="logo"><img src="images/logo.png"></a>
            <form action="" class="search-wrapper">
                <input type="text" name="" placeholder="공간을 검색해보세요" class="searchBar">
                <button type="submit" class="searchBtn">
                    <ion-icon name="search-sharp"></ion-icon>
                </button>
            </form>
            <%
    			if(ID == null){
   			%>
    			<a href="login.html"><div class="loginBtn"><p>로그인</p></div></a>
    		<%
    			} else {
   			%>
    			<div class="myIcons">
                <a href="myPostView.jsp"><div class="myIcon">
                    <i class="ri-file-list-line"></i>
                </div></a>
                <a href="rentView.jsp"><div class="myIcon">
                    <i class="ri-task-line"></i>
                </div></a>
                <a href="reserveView.jsp"><div class="myIcon">
                    <i class="ri-draft-line"></i>
                </div></a>
                <a href="myInfo.jsp"><div class="myIcon">
                    <i class="ri-emotion-happy-line"></i>
                </div></a>
            </div>
    		<%
    			}	
    		%>
        </nav>
    </header>
    <main>
        <section class="article">
       	 	<form action="reserveAction.jsp">
            <div class="article-wrapper">
                <div class="r-i-wrapper">
                    <div class="r-i-header">
                        <div class="r-i-slider">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src=<%= titleMain %>>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                        <div class="r-i-text">
                            <div class="a-box-title">
                                <h1 class="product"><%= post.getTITLE() %></h1>
                                <h5 class="address"><%= post.getADDRESS() %></h5>
                                <p class="spaceInfo">
                                    <%= post.getINFO() %>
                                </p>
                                <h2 class="price">₩<%= post.getPRICE() %> <span class="time">/ <%= post.getRENTAL_TIME() %></span></h2>
                            </div>
                            <div class="a-box-under">
                                <div class="a-box-text">
                                    <p>
                                        <span class="date"><ion-icon name="cloud-upload-sharp"></ion-icon><%=postDate %></span>
                                        <span class="view"><ion-icon name="eye-sharp"></ion-icon><%=post.getVIEW_COUNT() %></span>
                                    </p>
                                    <div class="star">
                                        <h4>
                                            ★<%=score %>점
                                        </h4>
                                    </div>
                        		</div>
                    		</div>
                		</div>
            		</div>
            		<input type="hidden" id="POST_NUM" name="POST_NUM" value="<%=postID%>">
            		<input type="hidden" id="EMAIL" name="EMAIL" value="<%=ID%>">
            		<input type="hidden" id="POST_TITLE" name="POST_TITLE" value="<%=post.getTITLE()%>">
            		<input type="hidden" id="PRICE" name="PRICE" value="<%=post.getPRICE()%>">
            		<input type="hidden" id="RENT_USEREMAIL" name="RENT_USEREMAIL" value="<%=post.getID()%>">
                    <input type="text" name = "RESERVE_DATE" placeholder="예약 날짜 예)2022/07/05" class="p-input" required />
                    <button type="submit" class="p-submitBtn"><p>예약하기</p></button>	
                </form>
        </section>
    </main>
    <footer>
        <div class="footer-wrapper">
            <p>
                Copyright (C) 2022 All Rights Reserved.
            </p>
        </div>
    </footer>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
    });
</script>

<script>
    $(document).ready(function() {
 
        $(".floating").hide();
        $(function() {
 
            $(window).scroll(function() {
                if ($(this).scrollTop() > 200) {
                    $('.floating').fadeIn();
                } else {
                    $('.floating').fadeOut();
                }
            });
        });
 
    });
</script>

<script src="js/jquery.scrollTo.min.js"></script>
<script>
    $(function () {
        $('.floating a').click(function (e) {
            $.scrollTo(this.hash || 0, 500); /* 속도 절, 숫자가 작을수록 빠름 */
            e.preventDefault();
        });
    });
</script>

<script>
    if (window.navigator.userAgent.match(/MSIE|Internet Explorer|Trident/i)) {
        // IE!!
        window.location = 'https://support.microsoft.com/ko-kr/office/%ec%97%b0%ea%b2%b0%ed%95%98%eb%a0%a4%eb%8a%94-%ec%9b%b9-%ec%82%ac%ec%9d%b4%ed%8a%b8%ea%b0%80-internet-explorer%ec%97%90%ec%84%9c-%ec%9e%91%eb%8f%99%ed%95%98%ec%a7%80-%ec%95%8a%ec%8a%b5%eb%8b%88%eb%8b%a4-8f5fc675-cd47-414c-9535-12821ddfc554?ui=ko-kr&rs=ko-kr&ad=kr';
    }
</script>

</html>