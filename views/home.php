<head>
<!-- CSS Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<!-- JavaScript Bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<?php
    $listProducts = $ProductModel->select_products_limit(8);

    $listCategories = $CategoryModel->select_categories_limit(8);

    $product_limit_3 = $ProductModel->select_products_limit(3);
    $product_order_by = $ProductModel->select_products_order_by(3, 'ASC');
?>

<!-- Banner Section Begin -->
<section class="container my-3">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" style="border-radius: 10px;">
                        <div class="carousel-item active" >
                            <img class="img-fluid" src="upload/5.jpg" alt="Image">
                            
                        </div>
                        <div class="carousel-item" >
                            <img class="img-fluid" src="upload/6.jpg" alt="Image">
                            
                        </div>
                        <div class="carousel-item" >
                            <img class="img-fluid" src="upload/8.jpg" alt="Image">
                            
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                    
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer" >
                    <img class="img-fluid"src="upload/6.jpg" alt="">
                    
                </div>
                <div class="product-offer">
                    <img class="img-fluid" src="upload/8.jpg" alt="">
                    
                </div>
            </div>
        </div>
    </section>
    <style>
    .carousel-inner img {
        width: 100% !important;
        height: 310px !important;
        object-fit: cover !important;
    }

    .product-offer {
        margin-bottom: 10px; /* Khoảng cách giữa các div */
        border-radius: 10px; /* Bo góc ảnh */
        overflow: hidden; /* Đảm bảo ảnh không tràn ra ngoài container */
    }

    .product-offer img {
        width: 100%; /* Ảnh chiếm toàn bộ chiều rộng container */
        height: 200px; /* Chiều cao cố định */
        object-fit: cover; /* Cắt ảnh để vừa khít container */
    }
    </style>
    <!-- Banner Section End -->


<!-- Product Section Begin -->
<section class="product spad" style="background-color: #F4F4F9;">

    <!-- CATER -->
    <section class="container cate-home" style="background-color: #ffffff; border-radius: 10px;">    
    <div class="section-title pt-2" style="margin-bottom: 30px;">
        <h4>Danh mục sản phẩm</h4>
    </div>
    
    <div class="row g-1 mb-4 mt-2 pb-4 justify-content-around">
        <?php foreach ($listCategories as $value) {
            extract($value);
            $link = 'index.php?url=danh-muc-san-pham&id=' .$category_id;
        ?>
        <div class="col-lg-2 col-md-3 col-sm-6 text-center p-2 cate-gory">
            <a href="<?=$link?>">
                <img style="width: 80%; border-radius: 15%; display: block; margin: 0 auto;" src="upload/<?=$image?>" alt="">
            </a>
            <div class="mt-2">
                <a class="cate-name text-dark" href="<?=$link?>"><?=$name?></a>
            </div>
        </div>
        <?php } ?>
    </div>
</section>

    <!-- CATE END-->


    <div class="container" style="background-color: #ffffff; border-radius: 10px;">
        
        <div class="row pt-3">
            <div class="col-lg-4 col-md-4">
                <div class="section-title">
                    <h4>Sản phẩm</h4>
                </div>
            </div>
            
        </div>
        <div class="row property__gallery">
            <?php foreach ($listProducts as $product) {
                extract($product);

                $discount_percentage = $ProductModel->discount_percentage($price, $sale_price);
            ?>
            <div class="col-lg-3 col-md-4 col-sm-6 mix sach-1">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="upload/<?=$image?>">
                        <!-- <div class="label sale">Sale</div> -->
                        <div class="label_right sale">-<?=$discount_percentage?></div>
                        <ul class="product__hover">
                            <li><a href="upload/<?=$image?>" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li>
                                <a href="index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>">
                                <span class="icon_search_alt"></span>
                                </a>
                            </li>
                            
                            
                            <li>
                                <?php if(isset($_SESSION['user'])) {?>
                                <form action="index.php?url=gio-hang" method="post">
                                    <input value="<?=$product_id?>" type="hidden" name="product_id">
                                    <input value="<?=$_SESSION['user']['id']?>" type="hidden" name="user_id">
                                    <input value="<?=$name?>" type="hidden" name="name">
                                    <input value="<?=$image?>"type="hidden" name="image">
                                    <input value="<?=$sale_price?>" type="hidden" name="price">
                                    <input value="1" type="hidden" name="product_quantity">
                                    <input value="<?=$image?>" type="hidden" name="image">

                                    <button type="submit" name="add_to_cart" id="toastr-success-top-right">
                                        <a href="#" ><span class="icon_bag_alt"></span></a>
                                    </button>
                                </form>
                                <?php }else{?>
                                    <button type="submit" onclick="alert('Vui lòng dăng nhập để thực hiện chức năng');" name="add_to_cart" id="toastr-success-top-right">
                                        <a href="dang-nhap" ><span class="icon_bag_alt"></span></a>
                                    </button>
                                <?php }?>
                            </li>
                            
                        </ul>
                        
                    </div>
                    <style>
                        .label_right.sale {
                        border-radius: 10px; /* Bo tròn góc với bán kính 10px */
                        padding: 5px 10px; /* Thêm khoảng cách bên trong */
                        background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ đen, tùy chỉnh theo ý thích */
                        color: white; /* Màu chữ trắng */
                        font-size: 14px; /* Kích thước chữ, có thể điều chỉnh */
                    }
                    </style>
                    <div class="product__item__text">
                        <h6 class="text-truncate-1"><a href="index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><?=$name?></a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price"><?=number_format($sale_price) ."₫"?> <span><?=number_format($price)."đ"?></span></div>
                    </div>
                </div>
            </div>

            <?php 
            } 
            ?>

            
            
            <div class="col-lg-12 text-center mb-4">
                <a href="index.php?url=cua-hang" class="btn btn-outline-primary">Xem tất cả</a>
            </div>
        </div>
        
    </div>


    

</section>


<!-- Banner Section Begin -->
<section class="banner">
    <video autoplay muted loop id="banner-video">
        <source src="upload/Untitled video - Made with Clipchamp.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <!-- Lớp mờ đen -->
    <div class="overlay"></div>
</section>

<style>
.banner {
    position: relative;
    width: 100%;
    height: 400px; /* Chiều cao full màn hình */
    overflow: hidden;
}

#banner-video {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover; /* Giúp video phủ đầy phần tử mà không bị méo */
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* Màu nền mờ đen với độ mờ 60% */
    z-index: 1; /* Lớp mờ nằm trên video */
}
</style>
<!-- Banner Section End -->

<!-- Trend Section Begin -->
<section class="trend spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>Xu hướng</h4>
                    </div>
                    <?php
                        foreach ($product_limit_3 as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>BÁN CHẠY</h4>
                    </div>
                    <?php
                        foreach ($product_order_by as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>Hot sale</h4>
                    </div>
                    <?php
                        foreach ($product_limit_3 as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Trend Section End -->

<!-- Discount Section Begin -->
<section class="discount">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="discount__pic">
                    <img src="upload/1.jpg" alt="Hình ảnh">
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="discount__text">
                    <div class="discount__text__title">
                        <span>Khuyến mãi</span>
                        <h2>31 - 12</h2>
                        <h5><span>Sale</span> 30%</h5>
                    </div>
                    <div class="discount__countdown" id="countdown-time">
                        <div class="countdown__item">
                            <span id="days"></span>
                            <p>Ngày</p>
                        </div>
                        <div class="countdown__item">
                            <span id="hours"></span>
                            <p>Giờ</p>
                        </div>
                        <div class="countdown__item">
                            <span id="minutes"></span>
                            <p>Phút</p>
                        </div>
                        <div class="countdown__item">
                            <span id="seconds"></span>
                            <p>Giây</p>
                        </div>
                    </div>

                    <script>
                        var countdownDate = new Date("Dec 31, 2024 23:59:59").getTime(); // Thời gian đếm ngược

                        var x = setInterval(function() {
                            var now = new Date().getTime(); // Lấy thời gian hiện tại
                            var distance = countdownDate - now; // Tính khoảng cách thời gian còn lại

                            var days = Math.floor(distance / (1000 * 60 * 60 * 24)); // Tính số ngày
                            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); // Tính số giờ
                            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); // Tính số phút
                            var seconds = Math.floor((distance % (1000 * 60)) / 1000); // Tính số giây

                            // Cập nhật kết quả lên HTML
                            document.getElementById("days").innerHTML = days;
                            document.getElementById("hours").innerHTML = hours;
                            document.getElementById("minutes").innerHTML = minutes;
                            document.getElementById("seconds").innerHTML = seconds;

                            // Nếu countdown kết thúc, dừng lại và hiển thị thông báo
                            if (distance < 0) {
                                clearInterval(x);
                                document.getElementById("countdown-time").innerHTML = "Đếm ngược kết thúc!";
                            }
                        }, 1000); // Cập nhật mỗi giây
                    </script>
                    <a href="index.php?url=cua-hang">Mua ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Discount Section End -->

<!-- Services Section Begin -->
<section class="services spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-car"></i>
                    <h6>Miễn phí vận chuyển</h6>
                    <p>Cho tất cả các đơn hàng trên 200.000đ</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-money"></i>
                    <h6>Đảm bảo hoàn tiền</h6>
                    <p>Nếu sản phẩm có vấn đề</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-support"></i>
                    <h6>Hỗ trợ trực tuyến 24/7</h6>
                    <p>Hỗ trợ chuyên dụng</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-headphones"></i>
                    <h6>Thanh toán an toàn</h6>
                    <p>Thanh toán an toàn 100%</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Services Section End -->