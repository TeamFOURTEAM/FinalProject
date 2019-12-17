<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="이재형">
    <meta name="description" content="반려동물용품목록">
    <title>반려동물용품목록</title>

    <!-- Style -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/shop/shop_list.css">
    <link rel="stylesheet" href="css/main/font-awesome.css">
</head>
<body>
	<div class="container">
        <!-- 검색 바 -->
        <div class="searchBar">
            <!-- 검색폼 -->
            <form method="GET" action="#">
                <div class="searchRow">
                    <select name="board_search" class="search_box">
                        <option value="all"">전체</option>
                        <option value="title">상품명</option>
                        <option value="Price"">가격</option>
                    </select>
                    <input type="text" style="width: 250px;" placeholder="검색어를 입력해주세요."
                         class="search_word">
                    <button type="submit" class="search_btn" title="검색">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>
            </form>
        </div>
        <!--//검색 바 -->
        
        <!-- 검색 결과 수 -->
        <div class="searchResultRow">
            ""에 대한 ""개의 검색 결과가 있습니다.
        </div>
        <!--//검색 결과 -->

        <!-- 검색 결과 목록 -->
        <div class="searchList">
            <!-- 인기순 상품 목록 -->
            <div class="bestGoodsList">
               <div class="shopListTitle">인기 상품 목록</div>

               <div class="itemContainer">
                <div class="itemImgBox">
                    <div class="itemImg">
                        <a href="#">
                            <img src="./img/shop/ListGoods01.jpg" alt="imgTest" width="200" height="200">
                        </a>
                    </div>
                    <span class="bestCount">Best 1</span>
                </div>
                
                <div class="itemNameRow">
                    <span><a href="#" class="itemName">고양이 화장실</a></span>
                </div>
                <div class="itemPriceRow">
                    <span class="itemPrice">\20,000</span>
                </div>
                <div class="itemRecoRow">
                    <span class="bestNum">추천수: 1</span>
                </div>
               </div>

               <div class="itemContainer">
                <div class="itemImgBox">
                    <div class="itemImg">
                        <a href="#">
                            <img src="./img/shop/ListGoods01.jpg" alt="imgTest" width="200" height="200">
                        </a>
                    </div>
                    <span class="bestCount">Best 2</span>
                </div>
                
                <div class="itemNameRow">
                    <span><a href="#" class="itemName">고양이 화장실</a></span>
                </div>
                <div class="itemPriceRow">
                    <span class="itemPrice">\20,000</span>
                </div>
                <div class="itemRecoRow">
                    <span class="bestNum">추천수: 1</span>
                </div>
               </div>

               <div class="itemContainer">
                <div class="itemImgBox">
                    <div class="itemImg">
                        <a href="#">
                            <img src="./img/shop/ListGoods01.jpg" alt="imgTest" width="200" height="200">
                        </a>
                    </div>
                    <span class="bestCount">Best 3</span>
                </div>
                
                <div class="itemNameRow">
                    <span><a href="#" class="itemName">고양이 화장실</a></span>
                </div>
                <div class="itemPriceRow">
                    <span class="itemPrice">\20,000</span>
                </div>
                <div class="itemRecoRow">
                    <span class="bestNum">추천수: 1</span>
                </div>
                </div>
            </div>
            <!--//인기순 상품 목록 -->

            <!-- 일반 상품 목록 -->
            <div class="goodsList">
                <div class="shopListTitle">일반 상품 목록</div>

                <div class="itemContainer">
                    <div class="itemImgBox">
                        <div class="itemImg">
                            <a href="#">
                                <img src="./img/shop/ListGoods02.jpg" alt="imgTest" width="200" height="200">
                            </a>
                        </div>
                    </div>
                    
                    <div class="itemNameRow">
                        <span><a href="#" class="itemName">강아지 마약방석</a></span>
                    </div>
                    <div class="itemPriceRow">
                        <span class="itemPrice">\20,000</span>
                    </div>
                    <div class="itemRecoRow">
                        <span class="bestNum">추천수: 1</span>
                    </div>
                </div>

                <div class="itemContainer">
                    <div class="itemImgBox">
                        <div class="itemImg">
                            <a href="#">
                                <img src="./img/shop/ListGoods02.jpg" alt="imgTest" width="200" height="200">
                            </a>
                        </div>
                    </div>
                    
                    <div class="itemNameRow">
                        <span><a href="#" class="itemName">강아지 마약방석</a></span>
                    </div>
                    <div class="itemPriceRow">
                        <span class="itemPrice">\20,000</span>
                    </div>
                    <div class="itemRecoRow">
                        <span class="bestNum">추천수: 1</span>
                    </div>
                </div>

                <div class="itemContainer">
                    <div class="itemImgBox">
                        <div class="itemImg">
                            <a href="#">
                                <img src="./img/shop/ListGoods02.jpg" alt="imgTest" width="200" height="200">
                            </a>
                        </div>
                    </div>
                    
                    <div class="itemNameRow">
                        <span><a href="#" class="itemName">강아지 마약방석</a></span>
                    </div>
                    <div class="itemPriceRow">
                        <span class="itemPrice">\20,000</span>
                    </div>
                    <div class="itemRecoRow">
                        <span class="bestNum">추천수: 1</span>
                    </div>
                </div>

                <div class="itemContainer">
                    <div class="itemImgBox">
                        <div class="itemImg">
                            <a href="#">
                                <img src="./img/shop/ListGoods02.jpg" alt="imgTest" width="200" height="200">
                            </a>
                        </div>
                    </div>
                    
                    <div class="itemNameRow">
                        <span><a href="#" class="itemName">강아지 마약방석</a></span>
                    </div>
                    <div class="itemPriceRow">
                        <span class="itemPrice">\20,000</span>
                    </div>
                    <div class="itemRecoRow">
                        <span class="bestNum">추천수: 1</span>
                    </div>
                </div>

            </div>
            <!--//일반 상품 목록 -->
        </div>
        <!--//검색 결과 목록 -->

        <!-- 페이징 wrapper -->
        <div class="paging_wrapper">
            <a href="#">
                <i class="fa fa-angle-double-left" aria-hidden="true"></i>
                <span class="ir_su">prev_page</span>
            </a>
            <a href="#">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
                <span class="ir_su">prev</span>
            </a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <span class="ir_su">next</span>
            </a>
            <a href="#">
                <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                <span class="ir_su">next_page</span>
            </a>
        </div>
        <!--//페이징 wrapper -->
    </div>
</body>
</html>