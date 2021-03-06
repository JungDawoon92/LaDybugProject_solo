<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lady bug</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/shepe/resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="/shepe/resources/chatcss/styles.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="<c:url value ="/resources/js/mobileCheck.js" />"></script>

</head>
<body>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Alert</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<br />진행중인 상담이 있습니다. <br />
					<br />
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary"
						onclick="button3_click()" data-dismiss="modal">상담이어하기</button>
					<button type="button" class="btn btn-danger"
						onclick="button2_click()">새로운상담하기</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade" id="noUserId">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Alert</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">로그인이 필요합니다...</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>




	<div class="container">
     <aside class="checkMobile" style="float:right; position: fixed; right: 5px; bottom: 95px; z-index: 1;  ">
	    <div id ="changechat">
	 		 
<div id ="change">
<div id="togglechat" style="background-color : #f4f5f7;  box-shadow: 0 30px 60px rgba(50, 50, 93, 0.25); width: 304px;height: 504px;">
	 <header class="header">
      <div class="header__header-column">
        <h1 class="header__title">Consult</h1>
      </div>
      <div class="header__header-column">
        <span class="header__icon">
          <i class="fas fa-cog"></i>
        </span>
      </div>
    </header>
    <main class="chats">
      <ul class="chats__list">
        <li class="chats__chat chat">
        	<c:choose>
			    <c:when test="${empty member_id}">
					<div id="chatgo"class="chats__chat friend friend--lg" data-toggle="modal" data-target="#noUserId">
			    </c:when>
			    <c:otherwise>
					<div id="chatgo"class="chats__chat friend friend--lg" onclick="button1_click()">
			    </c:otherwise>
			</c:choose>
              <div class="friend__column">
                <i class="fas fa-headset" style="font-size:35px;color:black;"></i> 
                <div class="friend__content" style="padding-left: 20px;">
                  <span class="friend__name">
                    			상담하기
                  </span>
                  <span class="friend__bottom-text">
                    			365일 24시간운영.
                  </span>
                </div>
              </div>
              <div class="friend__column">
                <span class="chat__timestamp">
                  August 3
                </span>
              </div>
            </div>
        </li>
      </ul>
    </main>
    
    
    
    <nav class="nav" style="display: inline-block; margin-top: 350px;">
      <ul class="nav__list">
        <li class="nav__list-item">
          <a href='javascript:void(0);' class="nav__list-link" onclick="buttonchatList_click()">
            <i class="far fa-user"></i
          ></a>
        </li>
        <li class="nav__list-item">
          <a href='javascript:void(0);' class="nav__list-link">
            <i class="fas fa-comment"></i>
          </a>
        </li>
        <li class="nav__list-item">
        <a href='javascript:void(0);' class="nav__list-link" onclick="함수();">
            <i class="fas fa-search"></i>
          </a>
        </li>
        <li class="nav__list-item">
          <a href='javascript:void(0);' class="nav__list-link" onclick="함수();">
            <i class="fas fa-ellipsis-h"></i>
          </a>
        </li>
      </ul>
    </nav>
</div>
</div>
	  	</div>
	</aside>
	<button type="button" id="chatbutton" class="btn btn-outline-light btn-lg btn_color" style="position: fixed; right: 5px; bottom: 20px; z-index: 2;"><i class='far fa-comment-dots' style='font-size:48px;color:black;-webkit-transform: scaleX(-1);'></i><span id="unread" class="badge badge-pill badge-danger" style="position: absolute;right: 11px;"></span></button>
	</div>
	    
    <script>
    
    	$(document).ready(function(){
    		
    		if ("mobile" === sessionStorage.getItem("SessionCheckMobile")) {
				$( '.checkMobile' ).css( "top", "80px;" );
			} else {
				$( '.checkMobile' ).css( "top", "280px;" );
			}
    		
    		
    		  			
			  $("#chatbutton").click(function(){
			    $("#togglechat").fadeToggle();
			  });
			  getUnread();
			  getInfiniteUnread();
			});
    	
    	
	  	function getUnread() {
			$.ajax({
				type: "POST",
				url: "chatUnread",
				data: {
					userID: encodeURIComponent('${member_id}'),
				},
				success: function(result) {
					if(result >= 1) {
						showUnread(result);
					} else {
						showUnread('');
					}
				}
			});
		}
	  	
	  	function showUnread(result) {
			$('#unread').html(result);
		}
	  	
		function getInfiniteUnread() {
			setInterval(function() {
				getUnread();
			}, 4000);
		}
		
		function button1_click() {
			$.ajax({
				type : "POST",
				url : "chatCompleteCheck",
				data : {
					userID : '${member_id}'
				}
			}).done(function(a) {
				if(a === 1 || a === -1){
					
					$.ajax({
				  	    url: "chat",
				  	  	cache: false
				   }).done(function (fragment) {
				         $("#change").replaceWith(fragment);
				    });
					
				} else {
					$("#myModal").modal();
				}
			});
		}

		
//////////////////////////////////////////////////
		function button2_click() {
			$('#myModal').modal('hide');
			
			$.ajax({
				type : "POST",
				url : "chatAllComplete",
				data : {
					userID : '${member_id}'
				}
		   }).done(function () {
			   $.ajax({
			  	    url: "chat",
			  	  	cache: false
			   }).done(function (fragment) {
			         $("#change").replaceWith(fragment);
			    });
		    });
		}
		
		function button3_click() {
			$('#myModal').modal('hide');
			
			let messageconnect = "ClientConnect입니다.";
			webSocket.send(messageconnect);
			
			//상담이어하기
			$.ajax({
			type : "POST",
			url : "selectChatroomnum",
			data : {
				userID : '${member_id}'
			}
		}).done(function(chatroomnum) {
			sessionStorage.removeItem("roomnum");
	  		sessionStorage.setItem("roomnum", chatroomnum);

			$.ajax({
		  	    url: "chatroomlistpage",
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#change").replaceWith(fragment);
		    });

		});

	}
		
//////////////////////////////////////////////////		
		function buttonchatList_click() {

			$.ajax({
		  	    url: "chatlist",
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#change").replaceWith(fragment);
		    });
		}
		
		$(window).on("beforeunload", function(){

			let clientconnectout = "ClientLogout입니다.";			
			webSocket.send(clientconnectout);
		});
		
	</script>
	<script>

var url = "ws://localhost:8090/shepe/broadsocket/";
url += '${member_id}';

var id = '${member_id}';

if(id != 'null') {
	var webSocket = new WebSocket(
	url);
	}
</script>

<script>
	if (jQuery.browser.mobile == true) {
		sessionStorage.setItem("SessionCheckMobile", "mobile");
		$( '.checkMobile' ).css( "top", "80px" );
	} else {
		sessionStorage.setItem("SessionCheckMobile", "pc");
		$( '.checkMobile' ).css( "top", "80px" );
	}
</script>


</body>
</html>