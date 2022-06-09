<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/promotion.css">
    <link rel="stylesheet" href="css/article.css">
    <link rel="stylesheet" href="css/write.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/floating.css">
    <link rel="shortcut icon" href="images/favicon.png"  type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Document</title>
</head>
	<%
		String ID = null;
		if(session.getAttribute("ID") != null){
			ID = (String) session.getAttribute("ID");
		}
	%>
<body>
    <div class="floating">
        <a href="/"><div class="topBtn">
            <i class="ri-arrow-up-s-line"></i>
        </div></a>
    </div>
    <header>
        <nav>
            <a href="/" class="logo"><img src="images/logo.png"></a>
            <form action="" class="search-wrapper">
                <input type="text" name="" placeholder="공간을 검색해보세요" class="searchBar">
                <button type="submit" class="searchBtn">
                    <ion-icon name="search-sharp"></ion-icon>
                </button>
            </form>
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
        </nav>
    </header>
    <main>
        <section class="article">
            <div class="article-wrapper">
                <h1 class="write-title">
                    게시글 작성
                </h1>
                <form action="postingAction.jsp" class="write-wrapper">
                	<input type="hidden" name="ID" class="write-input" readonly value = <%=ID%> required />
                    <input type="text" name="TITLE" class="write-input" placeholder="제목을 입력하세요" required />
                    <input type="text" name="INFO" class="write-input" placeholder="소개문을 입력하세요" required />
                    <textarea name="POST_CONTENTS" class="write-textarea" placeholder="내용을 입력하세요" required ></textarea>
                    <input type="text" id="ADDRESS" name="ADDRESS" class="write-input" placeholder="주소를 입력하세요" required />
                    <div class="write-submit" onclick="sample5_execDaumPostcode()" style = "color:white" >주소검색</div>
                    <script>
                    	function sample5_execDaumPostcode() {
                        	new daum.Postcode({
                            	oncomplete: function(data) {
                                	var addr = data.address; // 최종 주소 변수

                                	// 주소 정보를 해당 필드에 넣는다.
                                	document.getElementById("ADDRESS").value = addr;
                            	}
                        	}).open();
                    	}
                    </script>
                    <input type="text" name="PRICE" class="write-input" placeholder="대여금액을 입력하세요" required />
                    <input type="text" name="RENTAL_TIME" class="write-input" placeholder="대여 시간을 입력하세요 예)17:00~익일10:00" required />
                    <input type="file" name="" class="write-file">
                    <div class="submit-wrapper">
                        <button type="button" name="" class="write-submit w-delete">
                            <p>삭제하기</p>
                        </button>
                        <button type="submit" name="" class="write-submit">
                            <p>작성하기</p>
                        </button>
                    </div>
                </form>      
            </div>
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

<script>
    $('.id-notice').hide();

    $('.qm-id').mouseenter(function(){
        $('.id-notice').show();
    })

    $('.qm-id').mouseleave(function(){
        $('.id-notice').hide();
    })
</script>

<script>
    $('.img-notice').hide();

    $('.qm-img').mouseenter(function(){
        $('.img-notice').show();
    })

    $('.qm-img').mouseleave(function(){
        $('.img-notice').hide();
    })
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