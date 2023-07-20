<%-- 
    Document   : feedback
    Created on : 11-07-2023, 17:50:44
    Author     : Zarius
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Create Feedback</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        <style>
            .datatable-bottom, .datatable-top, .datatable-sorter, thead{
                display: none;
            }
            input{
                width: 100%;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="header.jsp" %>
        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="myOrder">My Order</a>
                            <a href="orderDetail?id=${orderID}">Order Detail</a>
                            <span>Feedback</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
        <section>
            <div id="layoutSidenav_content">
                <div class="container">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4" style="text-align: center;">Feedback</h1>
                            <div class="card mb-4">
                                <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                                <c:set var="listImage" value="${requestScope.listImage}" />
                                <c:set var="product" value="${requestScope.product}" />
                                <c:set var="productID" value="${product.getProductID()}" />
                                <c:set var="caseID" value="${listCaseID[productID]}" />
                                <c:set var="caseObject" value="${listImage[caseID]}" />
                                <form method="POST" action="createFeedback" enctype="multipart/form-data" id="feedbackForm">
                                    <input type="hidden" name="action" id="actionInput">
                                    <input type="hidden" name="orderID" value="${orderID}">
                                    <input type="hidden" name="productID" value="${product.getProductID()}">
                                    <div class="card-body">
                                        <table id="datatablesSimple">
                                            <tbody>
                                                <tr>
                                                    <th>FullName: </th>
                                                    <td><input style="background-color:#C5C5C5;" type="text" id="name" value="${sessionScope.user.getFullName()}" readonly/><br></td>
                                                </tr>
                                                <tr>
                                                    <th>Product: </th>
                                                    <td>
                                                        <a href="productDetail?productID=${productID}">
                                                            <img src="<%= request.getContextPath()%>/${caseObject.getImage()}" width="150" height="150">
                                                            <div class="cart__product__item__title">
                                                            </div>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Content: </th>
                                                    <td> <input type="text" id="content" name="content" placeholder="Enter content" /><br></td>
                                                </tr>
                                                <tr>
                                                    <th>Images</th>
                                                    <td>
                                                        <img id="previewImage"  alt="Feedback Picture" width="150" height="150">
                                                        <input type="file" id="feedbackPicture" name="feedbackPicture" accept="image/*" onchange="previewFeedbackPicture(event)">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Rating</th>
                                                    <td>
                                                        <div class="rating">
                                                            <input type="hidden" id="rating" name="rating" value="0" required>
                                                            <i class="fa fa-star-o" data-rating="1"></i>
                                                            <i class="fa fa-star-o" data-rating="2"></i>
                                                            <i class="fa fa-star-o" data-rating="3"></i>
                                                            <i class="fa fa-star-o" data-rating="4"></i>
                                                            <i class="fa fa-star-o" data-rating="5"></i>
                                                        </div>
                                                        <span id="rating-notification" style="display: none; color: red;"></span>
                                                    </td>
                                                </tr>
                                        </table>
                                        <input type="button" name="back" value="Back" class="btn-update" onclick="backToOrderList()"/>
                                        <input type="submit" name="create" value="Create Feedback" class="btn-update"/>  
                                    </div>
                                </form>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('.rating i').click(function () {
                                                    const ratingValue = $(this).data('rating');
                                                    $('#rating').val(ratingValue);
                                                    updateStarRating(ratingValue);
                                                });
                                            });

                                            function updateStarRating(ratingValue) {
                                                $('.rating i').each(function () {
                                                    const starRating = $(this).data('rating');
                                                    if (starRating <= ratingValue) {
                                                        $(this).removeClass('fa-star-o').addClass('fa-star');
                                                    } else {
                                                        $(this).removeClass('fa-star').addClass('fa-star-o');
                                                    }
                                                });
                                            }
                                            $('form').submit(function (event) {
                                                if ($(event.originalEvent.submitter).val() === 'Create Feedback' && $('#rating').val() < 1) {
                                                    event.preventDefault();
                                                    $('#rating-notification').text('Please choose at least 1 star').show();
                                                } else {
                                                    $('#rating-notification').hide();
                                                }
                                            });
                                            function previewFeedbackPicture(event) {
                                                var input = event.target;
                                                var preview = document.getElementById('previewImage');

                                                if (input.files && input.files[0]) {
                                                    var reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        preview.src = e.target.result;
                                                    };

                                                    reader.readAsDataURL(input.files[0]);
                                                }
                                            }

                                            function backToOrderList() {
                                                // Set the value of the hidden input field
                                                document.getElementById("actionInput").value = "back";

                                                // Submit the form
                                                document.getElementById("feedbackForm").submit();
                                            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Js Plugins -->
        <script src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery-ui.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/mixitup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.countdown.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.slicknav.js"></script>
        <script src="<%= request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.nicescroll.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
    </body>
</html>

