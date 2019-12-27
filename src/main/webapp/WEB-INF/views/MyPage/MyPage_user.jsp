<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/MyPage/MyPage_user.css">

<!-- jquery -->
<script>
    $(document).ready(function () {

        $('ul.tabs li').click(function () {
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');

            $(this).addClass('current');
            $("#" + tab_id).addClass('current');
        })

    });
</script>

<!-- 본문 내용 -->
<main>
    <section id="contents">
        <div class="container">
            <section id="cont">
                <article class="column col1">

                    <div id="menu">
                        <ul class="tabs">
                            <li class="tab-link current" data-tab="tab-1">내 정보</li>
                            <li class="tab-link" data-tab="tab-2">나의 게시물</li>
                            <li class="tab-link" data-tab="tab-3">장바구니</li>
                            <li class="tab-link" data-tab="tab-4">주문/배송조회</li>
                        </ul>
                    </div>
                    <!-- menu -->

                    <form action="">
                        <div id="tab-1" class="tab-content current">
                            <table>
                                <tr>
                                    <td>이름 : </td>
                                    <td>
                                        <input type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>아이디 : </td>
                                    <td>
                                        <input type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>비밀번호 : </td>
                                    <td>
                                        <input type="password" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>핸드폰 번호 : </td>
                                    <td>
                                        <input type="tel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>이메일 : </td>
                                    <td>
                                        <input type="email" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>성별 : </td>
                                    <td>
                                        <input type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" class="button">
                                        <input type="button" value="수정" />
                                        <input type="button" value="탈퇴" />
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </form>



                    <div id="tab-2" class="tab-content">
                        나의 게시물
                    </div>
                    <div id="tab-3" class="tab-content">
                        장바구니
                    </div>
                    <div id="tab-4" class="tab-content">
                        주문/배송조회
                    </div>

                </article>
            </section>
        </div>
    </section>
    <!-- contents -->
</main>

<jsp:include page="../include/footer.jsp" />