<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="이재형">
    <meta name="description" content="Final Project 메인">
    <title>Final Project Main</title>

    <!-- Style -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main/index.css">
    <link rel="stylesheet" href="css/main/slick.css">
    <link rel="stylesheet" href="css/main/font-awesome.css">
    <link rel="stylesheet" href="css/main/fullpage.css">

</head>
</head>

<body>
    <header id="main_header">
        <div class="container">
            <div class="row">
                <div class="header">
                    <div class="header_menu">
                        <a href="login">Login</a>
                        <a href="join">Join</a>
                    </div>
                    <!--//header_menu -->

                    <div class="header_title">
                        <a href="#">CATS & DOGS</a>
                    </div>
                    <!--//header_title -->
                </div>
            </div>
        </div>
    </header>
    <!--//header -->

    <!-- main -->
    <main>
        <section id="contents">
            <div class="container">
                    <!-- 메뉴 영역 -->
                <nav id="nav">
                    <div class="nav">
                        <div class="nav_item">
                            <div id="fullpage">
                                <!-- section 1stPage ~ 4thPage -->
                                <div class="section">
                                    <div class="main_menu_img">
                                        <div class="main_menu_btn">
                                            <a href="cat/total_cat?class=cat" class="a1">고양이 분양</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="section">
                                    <div class="main_menu_img">
                                        <div class="main_menu_btn">
                                            <a href="dog/total_dog?class=dog" class="a1">강아지 분양</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="section">
                                    <div class="main_menu_img">
                                        <div class="main_menu_btn">
                                            <a href="shop/total_shop?class=shop" class="a3">SHOP</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="section">
                                    <div class="main_menu_img">
                                        <div class="main_menu_btn">
                                            <a href="community/total_commu?class=commu" class="a4">커뮤니티</a>
                                        </div>
                                    </div>
                                </div>
                                <!--//section 1stPage ~ 4thPage -->
                                <!--//nav -->

                                <!-- 5rdPage : slide and footer -->
                                <div class="section fp-auto-height">
                                    <article id="menu_slide">
                                        <div class="main_slide">
                                            <!-- main 이미지(슬라이드로 처리. 제일 뒤에 위치) -->
                                            <div>
                                                <a href="#">
                                                    <img src="/img/main/slider001.jpg" alt="이미지1">
                                                    <figcaption><em>Responsive Site1</em><span>슬라이드
                                                            플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span>
                                                    </figcaption>
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#">
                                                    <img src="/img/main/slider002.jpg" alt="이미지2">
                                                    <figcaption><em>Responsive Site2</em><span>슬라이드
                                                            플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span>
                                                    </figcaption>
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#">
                                                    <img src="/img/main/slider003.jpg" alt="이미지3">
                                                    <figcaption><em>Responsive Site3</em><span>슬라이드
                                                            플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span>
                                                    </figcaption>
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#">
                                                    <img src="/img/main/slider004.jpg" alt="이미지4">
                                                    <figcaption><em>Responsive Site4</em><span>슬라이드
                                                            플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span>
                                                    </figcaption>
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#">
                                                    <img src="/img/main/slider005.jpg" alt="이미지5">
                                                    <figcaption><em>Responsive Site5</em><span>슬라이드
                                                            플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span>
                                                    </figcaption>
                                                </a>
                                            </div>
                                        </div>
                                    </article>

                                    <!-- footer -->
                                    <footer id="footer">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="footer">
                                                        <ul>
                                                            <li><a href="#">사이트 도움말</a></li>
                                                            <li><a href="#">사이트 이용약관</a></li>
                                                            <li><a href="#">사이트 운영원칙</a></li>
                                                            <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                                                            <li><a href="#">책임의 한계와 법적고지</a></li>
                                                            <li><a href="#">게시중단요청서비스</a></li>
                                                            <li><a href="#">고객센터</a></li>
                                                        </ul>
                                                        <address>
                                                            Copyright ©
                                                            <a href="https://namu.wiki/w/%EA%B7%80%EB%A9%B8%EC%9D%98%20%EC%B9%BC%EB%82%A0/%EC%95%A0%EB%8B%88%EB%A9%94%EC%9D%B4%EC%85%98">
                                                            <strong>CATS & DOGS</strong></a>
                                                            All Rights Reserved.
                                                        </address>
                                                    </div>
                                                </div>
                                            </div>
                                    </footer>
                                    <!-- footer -->
                                </div>
                                <!--//5rdPage : slide and footer -->
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </main>
    <!--//main -->




    <!-- JavaScript Libraries -->
    <script src="js/jquery.js"></script>
    <script src="js/main/slick.min.js"></script>
    <script src="js/main/fullpage.js"></script>

    <script>
        //main fullPage 상하 슬라이드 
        $(document).ready(function () {
            $('#fullpage').fullpage({
                resize: true,
                // animateAnchor:false,
                // scrollOverflow: true,
                loopBottom: true,
                loopTop: true,
                // autoScrolling:true,
                responsiveWidth: 1500,
                fitSection: true,
                fitToSection: true,
                navigation: true,
                anchors: ['1stPage', '2ndPage', '3rdPage', '4rdPage', '5rdPage'],
                // menu: '.gnb',

                afterResponsive: function (isResponsive) {
                    $('.section').addClass('fp-auto-height')
                },
                afterLoad: function (anchorLink, index) {
                    // 콜백함수

                    // //section 2          
                    if (anchorLink == '2ndPage') {
                        //moving the image       
                        $('.section02 .animatedParent .animated').addClass('go');
                    } else {
                        // $('.section02 .animated').removeClass('go');
                    }
                    // //section 3          
                    if (anchorLink == '3rdPage') {
                        //moving the image           
                        $('.section03 .animatedParent .animated').addClass('go');
                    } else {
                        // $('.section03 .animated').removeClass('go');
                    }

                    // //section 4          
                    if (anchorLink == '4rdPage') {
                        $('.section04 .animatedParent .animated').addClass('go');

                    } else {
                        // $('.section04 .animated').removeClass('go');
                    }

                    // //section 5 : Slide and Footer         
                    if (anchorLink == '5rdPage') {
                        $('.section05 .animatedParent .animated').addClass('go');

                    } else {
                        // $('.section05 .animated').removeClass('go');
                    }
                }
            });
        });


        //main 이미지 슬라이드 .main_slide
        $('.main_slide').slick({
            centerMode: true,
            centerPadding: '0px',
            slidesToShow: 3,
            autoplay: false,
            autoplaySpeed: 2000,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 1
                    }
                }
            ]
        });

    </script>
</body>

</html>