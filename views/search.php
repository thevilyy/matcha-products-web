<?php
    $list_products = '';
    // Sản phẩm theo tên
    if(isset($_GET['query']) && !empty($_GET['query'])) {
        $query = trim($_GET['query']);
        $list_products = $ProductModel->search_products($query);
    }

    // Sản phẩm theo giá
    if(isset($_GET['from_price']) && isset($_GET['to_price'])) {
        $from_price = $_GET['from_price'];
        $to_price = $_GET['to_price'];

        $list_products = $ProductModel->search_products_by_price($from_price, $to_price);
    }
    
    // Giá cao và thấp nhất của sản phẩm
    $min_max_price = $ProductModel->get_min_max_prices();

    $list_catgories = $CategoryModel->select_all_categories();
?>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.php"><i class="fa fa-home"></i> Trang chủ</a>
                        <a href="index.php?url=cua-hang">
                            Tìm kiếm sản phẩm
                        </a>
                        <span>
                            <?php
                                if(isset($_GET['query'])) {
                                    echo $_GET['query'];
                                }
                                if(isset($_GET['from_price']) && isset($_GET['to_price'])) {
                                    echo "Giá từ ".$_GET['from_price']." đến ".$_GET['to_price'];
                                }
                            
                            ?>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="shop__sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <h4>DANH MỤC</h4>
                            </div>
                            <div class="categories__accordion">
                                <div class="accordion" id="accordionExample">
                                    <?php foreach ($list_catgories as $value) {
                                        extract($value);
                                    ?>
                                    <div class="card">
                                        <div class="card-heading active">
                                            <a href="index.php?url=danh-muc-san-pham&id=<?=$category_id?>" >
                                                <?=$name?>
                                            </a>
                                        </div>
                                        
                                    </div>
                                    <?php 
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if(is_array($list_products) && count($list_products) >0) {?>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                        <?php foreach ($list_products as $value) {
                            extract($value);
                            $discount_percentage = $ProductModel->discount_percentage($price, $sale_price);
                        ?>
                        <div class="col-lg-4 col-md-6 col-6-rp-mobile">
                            <div class="product__item sale">
                                <div class="product__item__pic set-bg" data-setbg="upload/<?=$image?>">
                                    <!-- <div class="label sale">New</div> -->
                                    <div class="label_right sale">-<?=$discount_percentage?></div>
                                    <style>
                                        .label_right.sale {
                                        border-radius: 10px; /* Bo tròn góc với bán kính 10px */
                                        padding: 5px 10px; /* Thêm khoảng cách bên trong */
                                        background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ đen, tùy chỉnh theo ý thích */
                                        color: white; /* Màu chữ trắng */
                                        font-size: 14px; /* Kích thước chữ, có thể điều chỉnh */
                                      }
                                    </style>
                                    <ul class="product__hover">
                                        <li><a href="upload/<?=$image?>" class="image-popup"><span class="arrow_expand"></span></a></li>
                                        <li>
                                            <a href="index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><span class="icon_search_alt"></span></a>
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
                                <div class="product__item__text">
                                    <h6 class="text-truncate-1"><a href="index.php?url=chitietsanpham&id_sp=<?= htmlspecialchars($product_id) ?>&id_dm=<?= htmlspecialchars($category_id) ?>"><?=$name?></a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price"><?=number_format($sale_price)."₫"?> <span><?=number_format($price)."đ"?> </span></div>
                                </div>
                            </div>
                        </div>
                        <?php 
                        }
                        ?>
                        
                        
                    </div>
                </div>
                <?php }else {?>
                <div class="col-lg-9 col-md-9">
                    <div class="container-fluid mt-5">
                        <div class="row rounded justify-content-center mx-0 pt-5">
                            <div class="col-md-6 text-center">
                                <h4 class="mb-4">Không tìm thấy kết quả</h4>
                                <form action="tim-kiem" method="get">
                                    <div class="form-outline">
                                        <input type="search" name="query" class="form-control" placeholder="Tìm kiếm" />
                                    </div>
                                </form>
                                <a class="btn btn-primary rounded-pill py-3 px-5 mt-5" href="index.php?url=cua-hang">Trở lại cửa hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
                <?php }?>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->