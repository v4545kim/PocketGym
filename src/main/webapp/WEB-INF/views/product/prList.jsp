<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>

<head>

</head>

<body>
<jsp:include page="./../header.jsp" />
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-cart"></i>쇼핑몰<a href="<%=contextPath%>/prcartlist.pr">장바구니</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-1.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="<%=contextPath%>/prdetail.pr?pr_id=1">스트랩</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-2.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">덤벨</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-3.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">Man gets life in prison for stabbing</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-4.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">Russia's first male synchronised swimmer</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-5.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">NYC measles vaccination order prevails in court</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-6.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">The Week in Pictures: April 11 - 18</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-7.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">Man who pretended to be faces new charges</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-8.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">Lenny Kravitz gives Arch Digest a look inside</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-9.jpg" alt="">
                        <div class="blog-widget">
                        </div>
                        <h4><a href="./blog-details.jsp">Lenny Kravitz gives Arch Digest a look inside</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Phone</span>
                        <p>(123) 118 9999 - (123) 118 9999</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Address</span>
                        <p>72 Kangnam, 45 Opal Point Suite 391</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Email</span>
                        <p>contactcompany@Gutim.com</p>
                    </div>
                </div>
            </div>
            <div class="subscribe-option set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/footer-signup.jpg">
                <div class="so-text">
                    <h4>Subscribe To Our Mailing List</h4>
                    <p>Sign up to receive the latest information </p>
                </div>
                <form action="#" class="subscribe-form">
                    <input type="text" placeholder="Enter Your Mail">
                    <button type="submit"><i class="fa fa-send"></i></button>
                </form>
            </div>
            <div class="copyright-text">
                <ul>
                    <li><a href="#">Term&Use</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
                <p>&copy;<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></p>
                <div class="footer-social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/masonry.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script> 
</body>
</html>