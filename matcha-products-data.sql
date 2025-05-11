SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan_matcha`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`) VALUES
(17, 15, 'Vĩnh Long 123'),
(18, 6, 'Hà Nội');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'Trà Nhật Bản', 'trà nhật bản.jpg', 1),
(4, 'Dụng cụ pha trà', 'dụng cụ pha trà.jpg', 1),
(6, 'Matcha', 'matcha.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(115, 58, 54, 2, 245000),
(116, 58, 55, 1, 135000),
(117, 59, 56, 2, 295000),
(118, 60, 54, 3, 245000),
(119, 61, 52, 3, 1410000),
(120, 62, 45, 2, 183000),
(121, 63, 48, 1, 100000),
(122, 64, 55, 1, 135000),
(123, 64, 56, 1, 295000),
(124, 65, 52, 1, 1410000),
(125, 66, 56, 1, 295000),
(126, 67, 53, 1, 990000),
(127, 68, 53, 49, 990000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(58, 16, '2024-12-05 11:59:28', 625000, 'Thủ Đức', '0931938602', '', 4),
(59, 16, '2024-12-05 13:20:51', 590000, 'Thủ Đức', '0931938602', '', 3),
(60, 16, '2024-12-05 13:23:36', 735000, 'Thủ Đức', '0931938602', '', 2),
(61, 16, '2024-12-17 18:20:14', 4230000, 'Thủ Đức', '0931938602', '', 1),
(62, 16, '2024-12-23 21:59:06', 366000, 'Thủ Đức', '0931938602', '', 4),
(63, 16, '2024-12-23 22:06:03', 100000, 'Thủ Đức', '0931938602', '', 1),
(64, 16, '2024-12-23 22:21:06', 430000, 'Thủ Đức', '0931938602', '', 1),
(65, 16, '2024-12-23 22:21:49', 1410000, 'Thủ Đức', '0931938602', '', 2),
(66, 16, '2024-12-23 22:23:26', 295000, 'Thủ Đức', '0931938602', 'Đóng gói hàng cẩn thận', 1),
(67, 16, '2024-12-23 22:42:38', 990000, 'Thủ Đức', '0931938602', '', 4),
(68, 16, '2024-12-23 22:50:34', 48510000, 'Thủ Đức', '0931938602', '', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 6, 'Bột trà xanh Matcha Natsu 50g', 'mc1.jpg', 50, 0, 119000, 99000, '2024-12-03 19:23:12', 3, '<p>Sản xuất từ vùng nguyên liệu thuộc tỉnh Shizuoka, vùng trông trà nổi tiếng lâu đời và có chất lượng cao nhất tại Nhật Bản.Bột Matcha Natsu được sản xuất từ các lá trà non trà thứ 3,4 trở đi, tính từ ngọn của búp trà xuống.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation. Tất cả các búp trà được thu hái duy nhất 1 lần vào vụ Xuân, sau đó được xử lý và lưu trữ để nghiền thành bột Matcha. Bột Matcha Natsu có vị đắng rõ nhất so với Aki và Haru, màu và mùi vị cũng ở mức trên trung bình (khoảng 7 điểm)&nbsp;</p><p>Thích hợp cho các nhu cầu sản xuất thực phẩm, mỹ phẩm, đồ uống phục vụ phân khúc trung lưu.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Natsu nhập khẩu chính hãng, nguyên chất 100%. Thích hợp cho phân khúc trung cấp. Dùng làm trà sữa matcha, làm bánh, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng. Đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(2, 6, 'Bột trà xanh Matcha Aki 50g', 'mc2.jpg', 50, 0, 139000, 119000, '2024-12-03 19:30:03', 1, '<p>Các búp trà để sản xuất ra bột trà xanh Matcha Aki được thu hái bằng tay, duy nhất một lần trong năm vào vụ Xuân, kéo dài 4-6 tuần, bắt đầu từ tháng 5 đến đầu tháng 6.&nbsp;</p><p>Bột Matcha Aki được sản xuất từ các lá thứ 2-3 của búp trà.&nbsp;</p><p>Hương vị màu sắc, độ mịn của Matcha Aki tốt hơn matcha Natsu, đánh giá được 8/10 điểm. Bột Matcha Aki pha chế ra màu sắp xanh sáng, ko ám vàng, màu và mùi vị trà hài hòa. thích hợp cho phân khúc trung cấp đến cao cấp, với mỗi 3g nguyên liệu Matcha Aki, phù hợp với giá bán thành phẩm đầu ra từ 35.000-45.000đ.&nbsp;</p><p>Tương tự như Matcha Natsu và Matcha Haru. Matcha Aki cũng được sản xuất từ các búp trà vụ Xuân. Aki chỉ đơn thuần là tên gọi, không có nghĩa là Matcha vụ thu. (Mặc dù Aki trong tiếng Nhật có nghĩa là mùa thu).<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Aki nhập khẩu chính hãng, Bột nguyên chất 100%. Thích hợp cho phân khúc trung cấp đến cao cấp. Dùng pha trà uống, làm trà sữa matcha, làm bánh, kem, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng, đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(37, 6, 'Bột trà xanh Matcha Natsu 100g', 'mc3.jpg', 50, 0, 199000, 179000, '2024-12-03 19:31:10', 0, '<p>Sản xuất từ vùng nguyên liệu thuộc tỉnh Shizuoka, vùng trông trà nổi tiếng lâu đời và có chất lượng cao nhất tại Nhật Bản.Bột Matcha Natsu được sản xuất từ các lá trà non trà thứ 3,4 trở đi, tính từ ngọn của búp trà xuống.</p><p>NSX: Maruyama Tea Products Corporation. Tất cả các búp trà được thu hái duy nhất 1 lần vào vụ Xuân, sau đó được xử lý và lưu trữ để nghiền thành bột Matcha.&nbsp;</p><p>Bột Matcha Natsu có vị đắng rõ nhất so với Aki và Haru, màu và mùi vị cũng ở mức trên trung bình (khoảng 7 điểm)&nbsp;</p><p>Thích hợp cho các nhu cầu sản xuất thực phẩm, mỹ phẩm, đồ uống phục vụ phân khúc trung lưu.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Natsu nhập khẩu chính hãng, nguyên chất 100%. Thích hợp cho phân khúc trung cấp. Dùng làm trà sữa matcha, làm bánh, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng. Đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(38, 6, 'Bột trà xanh Matcha Natsu 1kg', 'mc4.jpg', 50, 0, 1350000, 1130000, '2024-12-03 19:34:31', 1, '<p>Sản xuất từ vùng nguyên liệu thuộc tỉnh Shizuoka, vùng trông trà nổi tiếng lâu đời và có chất lượng cao nhất tại Nhật Bản.Bột Matcha Natsu được sản xuất từ các lá trà non trà thứ 3,4 trở đi, tính từ ngọn của búp trà xuống.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation. Tất cả các búp trà được thu hái duy nhất 1 lần vào vụ Xuân, sau đó được xử lý và lưu trữ để nghiền thành bột Matcha.&nbsp;</p><p>Bột Matcha Natsu có vị đắng rõ nhất so với Aki và Haru, màu và mùi vị cũng ở mức trên trung bình (khoảng 7 điểm)&nbsp;</p><p>Thích hợp cho các nhu cầu sản xuất thực phẩm, mỹ phẩm, đồ uống phục vụ phân khúc trung lưu.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Natsu nhập khẩu chính hãng, nguyên chất 100%. Thích hợp cho phân khúc trung cấp. Dùng làm trà sữa matcha, làm bánh, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng. Đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(39, 6, 'Bột trà xanh Matcha Aki 1kg', 'mc5.jpg', 50, 0, 1690000, 1410000, '2024-12-03 19:36:02', 0, '<p>Các búp trà để sản xuất ra bột trà xanh Matcha Aki được thu hái bằng tay, duy nhất một lần trong năm vào vụ Xuân, kéo dài 4-6 tuần, bắt đầu từ tháng 5 đến đầu tháng 6.&nbsp;</p><p>Bột Matcha Aki được sản xuất từ các lá thứ 2-3 của búp trà.&nbsp;</p><p>Hương vị màu sắc, độ mịn của Matcha Aki tốt hơn matcha Natsu, đánh giá được 8/10 điểm. Bột Matcha Aki pha chế ra màu sắp xanh sáng, ko ám vàng, màu và mùi vị trà hài hòa. thích hợp cho phân khúc trung cấp đến cao cấp, với mỗi 3g nguyên liệu Matcha Aki, phù hợp với giá bán thành phẩm đầu ra từ 35.000-45.000đ.&nbsp;</p><p>Tương tự như Matcha Natsu và Matcha Haru. Matcha Aki cũng được sản xuất từ các búp trà vụ Xuân. Aki chỉ đơn thuần là tên gọi, không có nghĩa là Matcha vụ thu. (Mặc dù Aki trong tiếng Nhật có nghĩa là mùa thu).</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Aki nhập khẩu chính hãng, Bột nguyên chất 100%. Thích hợp cho phân khúc trung cấp đến cao cấp. Dùng pha trà uống, làm trà sữa matcha, làm bánh, kem, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng, đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(40, 6, 'Bột trà xanh Matcha Haru 1kg', 'mc6.jpg', 50, 0, 2990000, 2482000, '2024-12-03 19:37:31', 0, '<p>Matcha Haru được sản xuất từ các búp trà trong đợt thu hái đầu tiên của vụ Xuân, chính vì vậy nên Haru có nội chất mạnh mẽ, màu xanh ngọc bích sáng, hương trà đậm đà dài lâu, vị hậu ngọt nổi rõ. Hàm lượng EGCG lên tới 10%. Các sản phẩm được chế biến với thành phần là bột Matcha Haru làm hài lòng những khách hàng khó tính nhất.&nbsp;</p><p>So với Matcha Natsu hay Aki, thì Haru ở đẳng cấp cao hơn, cả về hương vị, màu sắc và độ mịn, đạt điểm 9/10.&nbsp;</p><p>Matcha Haru thích hợp cho pha trà đạo và phân khúc cao cấp. Với mỗi 3g nguyên liệu Matcha Haru, phù hợp với giá bán thành phẩm đầu ra từ 45.000-60.000đ trở lên.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Haru là loại thượng hạng nhất của Matchashop. Thuộc top leader các dòng matcha cao cấp trên thị trường Việt Nam. Thích hợp dùng trong trà đạo và phân khúc cao cấp. Matcha Haru có màu xanh tươi đẹp nhất, vị trà mạnh mẽ, hương trà lưu luyến dài lâu và hậu ngọt tự nhiên.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(41, 6, 'Trà Xanh Matcha Haru 100gram', 'mc7.jpg', 50, 0, 424000, 352000, '2024-12-03 19:40:06', 0, '<p>Matcha Haru được sản xuất từ các búp trà trong đợt thu hái đầu tiên của vụ Xuân, chính vì vậy nên Haru có nội chất mạnh mẽ, màu xanh ngọc bích sáng, hương trà đậm đà dài lâu, vị hậu ngọt nổi rõ. Hàm lượng EGCG lên tới 10%. Các sản phẩm được chế biến với thành phần là bột Matcha Haru làm hài lòng những khách hàng khó tính nhất.&nbsp;</p><p>So với Matcha Natsu hay Aki, thì Haru ở đẳng cấp cao hơn, cả về hương vị, màu sắc và độ mịn, đạt điểm 9/10.&nbsp;</p><p>Matcha Haru thích hợp cho pha trà đạo và phân khúc cao cấp. Với mỗi 3g nguyên liệu Matcha Haru, phù hợp với giá bán thành phẩm đầu ra từ 45.000-60.000đ trở lên.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation.</p>', '<p>Bột trà xanh Matcha Haru là loại thượng hạng nhất của Matchashop. Thuộc top leader các dòng matcha cao cấp trên thị trường Việt Nam. Thích hợp dùng trong trà đạo và phân khúc cao cấp. Matcha Haru có màu xanh tươi đẹp nhất, vị trà mạnh mẽ, hương trà lưu luyến dài lâu và hậu ngọt tự nhiên.<br>&nbsp;</p>', 1),
(42, 6, 'Trà Xanh Matcha Natsu 100gram', 'mc9.jpg', 50, 0, 224000, 186000, '2024-12-03 19:42:47', 0, '<p>Sản xuất từ vùng nguyên liệu thuộc tỉnh Shizuoka, vùng trông trà nổi tiếng lâu đời và có chất lượng cao nhất tại Nhật Bản.Bột Matcha Natsu được sản xuất từ các lá trà non trà thứ 3,4 trở đi, tính từ ngọn của búp trà xuống.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation.&nbsp;</p><p>Tất cả các búp trà được thu hái duy nhất 1 lần vào vụ Xuân, sau đó được xử lý và lưu trữ để nghiền thành bột Matcha.&nbsp;</p><p>Bột Matcha Natsu có vị đắng rõ nhất so với Aki và Haru, màu và mùi vị cũng ở mức trên trung bình (khoảng 7 điểm).</p><p>Thích hợp cho các nhu cầu sản xuất thực phẩm, mỹ phẩm, đồ uống phục vụ phân khúc trung lưu.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Bột trà xanh Matcha Natsu nhập khẩu chính hãng, nguyên chất 100%. Thích hợp cho phân khúc trung cấp. Dùng làm trà sữa matcha, làm bánh, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng. Đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(43, 6, 'Trà Xanh Matcha Aki 100gram', 't8.jpeg', 50, 0, 270000, 225000, '2024-12-03 19:55:00', 0, '<p>Các búp trà để sản xuất ra bột trà xanh Matcha Aki được thu hái bằng tay, duy nhất một lần trong năm vào vụ Xuân, kéo dài 4-6 tuần, bắt đầu từ tháng 5 đến đầu tháng 6.&nbsp;</p><p>Bột Matcha Aki được sản xuất từ các lá thứ 2-3 của búp trà.&nbsp;</p><p>Hương vị màu sắc, độ mịn của Matcha Aki tốt hơn matcha Natsu, đánh giá được 8/10 điểm. Bột Matcha Aki pha chế ra màu sắp xanh sáng, ko ám vàng, màu và mùi vị trà hài hòa. thích hợp cho phân khúc trung cấp đến cao cấp, với mỗi 3g nguyên liệu Matcha Aki, phù hợp với giá bán thành phẩm đầu ra từ 35.000-45.000đ.&nbsp;</p><p>Tương tự như Matcha Natsu và Matcha Haru. Matcha Aki cũng được sản xuất từ các búp trà vụ Xuân. Aki chỉ đơn thuần là tên gọi, không có nghĩa là Matcha vụ thu. (Mặc dù Aki trong tiếng Nhật có nghĩa là mùa thu).</p>', '<p>Bột trà xanh Matcha Aki nhập khẩu chính hãng, Bột nguyên chất 100%. Thích hợp cho phân khúc trung cấp đến cao cấp. Dùng pha trà uống, làm trà sữa matcha, làm bánh, kem, pha chế đồ uống, pha trà và sản xuất mỹ phẩm, thực phẩm chức năng, đắp mặt nạ trà xanh.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(44, 6, 'Bột trà xanh Matcha Haru 50g', 'mc10.jpg', 50, 0, 219000, 182000, '2024-12-03 19:56:53', 0, '<p>Matcha Haru được sản xuất từ các búp trà trong đợt thu hái đầu tiên của vụ Xuân, chính vì vậy nên Haru có nội chất mạnh mẽ, màu xanh ngọc bích sáng, hương trà đậm đà dài lâu, vị hậu ngọt nổi rõ. Hàm lượng EGCG lên tới 10%. Các sản phẩm được chế biến với thành phần là bột Matcha Haru làm hài lòng những khách hàng khó tính nhất.&nbsp;</p><p>So với Matcha Natsu hay Aki, thì Haru ở đẳng cấp cao hơn, cả về hương vị, màu sắc và độ mịn, đạt điểm 9/10.&nbsp;</p><p>Matcha Haru thích hợp cho pha trà đạo và phân khúc cao cấp. Với mỗi 3g nguyên liệu Matcha Haru, phù hợp với giá bán thành phẩm đầu ra từ 45.000-60.000đ trở lên.&nbsp;</p><p>NSX: Maruyama Tea Products Corporation.</p>', '<p>Bột trà xanh Matcha Haru là loại thượng hạng nhất của Matchashop. Thuộc top leader các dòng matcha cao cấp trên thị trường Việt Nam. Thích hợp dùng trong trà đạo và phân khúc cao cấp. Matcha Haru có màu xanh tươi đẹp nhất, vị trà mạnh mẽ, hương trà lưu luyến dài lâu và hậu ngọt tự nhiên.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(45, 2, 'Trà gạo rang Genmaicha (bột)', 't1.jpg', 48, 2, 220000, 183000, '2024-12-03 19:57:52', 2, '<p>Genmaicha (玄米茶, brown rice tea) hay còn được gọi là trà gạo rang, trà gạo nâu.&nbsp;</p><p>Trà Genmaicha là một loại trà được pha trộn giữa gạo lứt rang và trà xanh. Trà Genmaicha cân bằng giữa vị trà xanh và vị thơm hấp dẫn của gạo lứt rang chín.Trà Genmaicha giúp thư giãn và tỉnh táo tinh thần. Một loại trà gần như không đắng chát, giúp dễ dàng sử dụng cho mọi lứa tuổi. Sử dụng Genmaicha để có tinh thần thư thái, cơ thể thư giãn và dưỡng sinh cho tâm hồn.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Genmaicha (玄米茶, brown rice tea) hay còn được gọi là trà gạo rang, trà gạo nâu. Sử dụng Genmaicha để có tinh thần thư thái, cơ thể thư giãn và dưỡng sinh cho tâm hồn.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(46, 2, 'Trà rang houjicha (bột)', 't2.jpg', 50, 0, 199000, 166000, '2024-12-03 19:58:50', 0, '<p>Trà Houjicha ( Hojicha) hay còn gọi là trà rang Nhật Bản. Đây là loại trà truyền thống và được dùng rộng rãi trong văn hóa ẩm thực Nhật. Đặc biệt ở Kyoto vì đây là nơi làm ra những mẻ trà Houjicha đầu tiên vào những năm 1920.&nbsp;</p><p>Nhìn vào màu sắc, trà Houjicha thoạt nhìn giống như một loại trà đen. Tuy nhiên trà Houjicha không bị ô-xi hóa như trà đen.</p>', '<p>Trà Houjicha ( Hojicha) hay còn gọi là trà rang Nhật Bản. Đây là loại trà truyền thống và được dùng rộng rãi trong văn hóa ẩm thực Nhật. Đặc biệt ở Kyoto vì đây là nơi làm ra những mẻ trà Houjicha đầu tiên vào những năm 1920.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(47, 2, 'Trà gạo rang Genmaicha (Lá)', 't3.jpg', 50, 0, 199000, 166000, '2024-12-03 19:59:30', 1, '<p>Genmaicha (玄米茶, brown rice tea) hay còn được gọi là trà gạo rang, trà gạo nâu.</p><p>Trà Genmaicha là một loại trà được pha trộn giữa gạo lứt rang và trà xanh. Trà Genmaicha cân bằng giữa vị trà xanh và vị thơm hấp dẫn của gạo lứt rang chín.&nbsp;</p><p>Trà Genmaicha giúp thư giãn và tỉnh táo tinh thần. Một loại trà gần như không đắng chát, giúp dễ dàng sử dụng cho mọi lứa tuổi. Sử dụng Genmaicha để có tinh thần thư thái, cơ thể thư giãn và dưỡng sinh cho tâm hồn.&nbsp;</p><p>Người Nhật coi Genmaicha là một loại trà chính thống, chứ không coi là một loại trà pha trộn. Có lẽ bởi vì họ đã thưởng thức Genmaicha trong một thời gian khá dài theo lịch sử.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Genmaicha (玄米茶, brown rice tea) hay còn được gọi là trà gạo rang, trà gạo nâu. Trà Genmaicha là một loại trà được pha trộn giữa gạo lứt rang và trà xanh. Trà Genmaicha cân bằng giữa vị trà xanh và vị thơm hấp dẫn của gạo lứt rang chín.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(48, 2, 'Trà rang Houjicha (Lá)', 't4.jpg', 49, 1, 120000, 100000, '2024-12-03 20:00:26', 0, '<p>Trà Houjicha ( Hojicha) hay còn gọi là trà rang Nhật Bản. Đây là loại trà truyền thống và được dùng rộng rãi trong văn hóa ẩm thực Nhật. Đặc biệt ở Kyoto vì đây là nơi làm ra những mẻ trà Houjicha đầu tiên vào những năm 1920.&nbsp;</p><p>Nhìn vào màu sắc, trà Houjicha thoạt nhìn giống như một loại trà đen. Tuy nhiên trà Houjicha không bị ô-xi hóa như trà đen.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Trà Houjicha ( Hojicha) hay còn gọi là trà rang Nhật Bản. Đây là loại trà truyền thống và được dùng rộng rãi trong văn hóa ẩm thực Nhật. Đặc biệt ở Kyoto vì đây là nơi làm ra những mẻ trà Houjicha đầu tiên vào những năm 1920.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(49, 2, 'Trà xanh Sencha Nhật Bản (Organic) 1kg', 't5.jpg', 50, 0, 1390000, 1160000, '2024-12-04 07:32:04', 0, '<p>Trà Sencha chất lượng cao chỉ chọn 1 búp trà non và lá đầu tiên. Búp lá trà non được thu hoạch, sau đó được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà.Trong quá trình chế biến trà hấp sâu được hấp lâu hơn khoảng một phút so với trà xanh thông thường của Nhật Bản. Điều này nghe có vẻ như là một thủ tục đơn giản, nhưng thực sự cần có kỹ năng và kiến ​​thức tuyệt vời, đến nỗi hầu hết các công ty trà ở Nhật Bản không thể làm được.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Trà xanh Sencha Organic chỉ đến từ những lá trà chất lượng nhất, được hái vào đầu mùa xuân. Lá tươi ngay lập tức được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà, đem đến hương vị đậm đà, hơi ngọt và màu xanh đậm. Thưởng thức một hương vị của mùa xuân trong mỗi cốc.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(50, 2, 'Trà xanh Sencha Nhật Bản (Organic) 500gram', 't6.jpg', 50, 0, 859000, 743000, '2024-12-04 07:32:46', 1, '<p>Trà Sencha chất lượng cao chỉ chọn 1 búp trà non và lá đầu tiên. Búp lá trà non được thu hoạch, sau đó được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà.Trong quá trình chế biến trà hấp sâu được hấp lâu hơn khoảng một phút so với trà xanh thông thường của Nhật Bản. Điều này nghe có vẻ như là một thủ tục đơn giản, nhưng thực sự cần có kỹ năng và kiến ​​thức tuyệt vời, đến nỗi hầu hết các công ty trà ở Nhật Bản không thể làm được.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Trà xanh Sencha Organic chỉ đến từ những lá trà chất lượng nhất, được hái vào đầu mùa xuân. Lá tươi ngay lập tức được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà, đem đến hương vị đậm đà, hơi ngọt và màu xanh đậm. Thưởng thức một hương vị của mùa xuân trong mỗi cốc.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(51, 2, 'Trà xanh Sencha Nhật Bản (Organic) 100gram', 't7.jpg', 50, 0, 199000, 166000, '2024-12-04 07:33:37', 2, '<p>Trà Sencha chất lượng cao chỉ chọn 1 búp trà non và lá đầu tiên. Búp lá trà non được thu hoạch, sau đó được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà.Trong quá trình chế biến trà hấp sâu được hấp lâu hơn khoảng một phút so với trà xanh thông thường của Nhật Bản. Điều này nghe có vẻ như là một thủ tục đơn giản, nhưng thực sự cần có kỹ năng và kiến ​​thức tuyệt vời, đến nỗi hầu hết các công ty trà ở Nhật Bản không thể làm được.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Trà xanh Sencha Organic chỉ đến từ những lá trà chất lượng nhất, được hái vào đầu mùa xuân. Lá tươi ngay lập tức được đưa vào hệ thống máy hấp hơi nước để làm chín lá trà, đem đến hương vị đậm đà, hơi ngọt và màu xanh đậm. Thưởng thức một hương vị của mùa xuân trong mỗi cốc.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(52, 2, 'Bột Than Tre Nhật Bản - Takesumi 1kg', 't9.jpeg', 46, 4, 1690000, 1410000, '2024-12-04 07:34:33', 2, '<p>Bột than tre Nhật Bản còn được biết đến với tên gọi \"Kim cương đen\" - được sản xuất từ loại tre Moso, loài tre lớn nhất và đẹp nhất của Nhật Bản. Công dụng của nó được phổ biến ở châu Á, đặc biệt là ở Nhật Bản, Hàn Quốc, Đài Loan và Trung Quốc. Bột than tre có hàm lượng khoáng chất cao như kali, canxi, sắt và natri. Và trong nhiều năm, người dân đặc biệt ở Nhật Bản sử dụng than tre cho nhiều mục đích, từ hộ gia đình, dụng cụ nhà bếp đến thuốc men như một loại \"thần dược\".&nbsp;</p><p>Đặc biệt, tinh than tre có khả năng hấp thụ độc tố và các chất dư thừa trong cơ thể. Đồng thời làm tăng vi khuẩn có lợi trong ruột, nâng cao lưu lượng máu quanh đường ruột giúp cải thiện đường tiêu hóa. ​Ngay cả các bác sĩ và nhà trị liệu khuyên dùng Takeumi nên được tiêu thụ trên cơ sở định kỳ để làm sạch bên trong cơ thể của bạn.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Sau matcha, bột than tre đang là “thần dược” sắc đẹp được người Nhật nói riêng và các nước châu Á nói chung ưa thích. Đây là loại than được đốt từ than tre ở Nhật – đạt độ tinh khiết và dinh dưỡng rất cao với các khoáng chất quý giá như kali, canxi, sắt, natri.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(53, 2, 'Bột Than Tre Nhật Bản - Takesumi 500g', 't10.jpeg', 30, 50, 990000, 990000, '2024-12-04 07:35:45', 11, '<p>Bột than tre Nhật Bản còn được biết đến với tên gọi \"Kim cương đen\" - được sản xuất từ loại tre Moso, loài tre lớn nhất và đẹp nhất của Nhật Bản. Công dụng của nó được phổ biến ở châu Á, đặc biệt là ở Nhật Bản, Hàn Quốc, Đài Loan và Trung Quốc. Bột than tre có hàm lượng khoáng chất cao như kali, canxi, sắt và natri. Và trong nhiều năm, người dân đặc biệt ở Nhật Bản sử dụng than tre cho nhiều mục đích, từ hộ gia đình, dụng cụ nhà bếp đến thuốc men như một loại \"thần dược\".&nbsp;</p><p>Đặc biệt, tinh than tre có khả năng hấp thụ độc tố và các chất dư thừa trong cơ thể. Đồng thời làm tăng vi khuẩn có lợi trong ruột, nâng cao lưu lượng máu quanh đường ruột giúp cải thiện đường tiêu hóa. ​Ngay cả các bác sĩ và nhà trị liệu khuyên dùng Takeumi nên được tiêu thụ trên cơ sở định kỳ để làm sạch bên trong cơ thể của bạn.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Sau matcha, bột than tre đang là “thần dược” sắc đẹp được người Nhật nói riêng và các nước châu Á nói chung ưa thích. Đây là loại than được đốt từ than tre ở Nhật – đạt độ tinh khiết và dinh dưỡng rất cao với các khoáng chất quý giá như kali, canxi, sắt, natri.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(54, 2, 'Bột Than Tre Nhật Bản - Takesumi 100g', 't11.jpeg', 45, 5, 245000, 245000, '2024-12-04 07:36:30', 3, '<p>Bột than tre Nhật Bản còn được biết đến với tên gọi \"Kim cương đen\" - được sản xuất từ loại tre Moso, loài tre lớn nhất và đẹp nhất của Nhật Bản. Công dụng của nó được phổ biến ở châu Á, đặc biệt là ở Nhật Bản, Hàn Quốc, Đài Loan và Trung Quốc. Bột than tre có hàm lượng khoáng chất cao như kali, canxi, sắt và natri. Và trong nhiều năm, người dân đặc biệt ở Nhật Bản sử dụng than tre cho nhiều mục đích, từ hộ gia đình, dụng cụ nhà bếp đến thuốc men như một loại \"thần dược\".&nbsp;</p><p>Đặc biệt, tinh than tre có khả năng hấp thụ độc tố và các chất dư thừa trong cơ thể. Đồng thời làm tăng vi khuẩn có lợi trong ruột, nâng cao lưu lượng máu quanh đường ruột giúp cải thiện đường tiêu hóa. ​Ngay cả các bác sĩ và nhà trị liệu khuyên dùng Takeumi nên được tiêu thụ trên cơ sở định kỳ để làm sạch bên trong cơ thể của bạn.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Sau matcha, bột than tre đang là “thần dược” sắc đẹp được người Nhật nói riêng và các nước châu Á nói chung ưa thích. Đây là loại than được đốt từ than tre ở Nhật – đạt độ tinh khiết và dinh dưỡng rất cao với các khoáng chất quý giá như kali, canxi, sắt, natri.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(55, 4, 'Muỗng xúc trà Matcha – Chasaku', 'dc1.jpg', 48, 2, 135000, 135000, '2024-12-04 07:37:00', 8, '<p>Đối với ai am hiểu về trà đạo không thể không biết đến vật dụng nhỏ bé Chasaku. Dụng cụ không thể thiếu trong truyền thống trà đạo của người Nhật. Muỗng xúc trà Chasaku là dụng cụ đong trà truyền thống của Nhật Bản. 1 muỗng đầy chasaku = ~ 1g.&nbsp;</p><p>Trà ngon không chỉ phụ thuộc vào loại trà mà nó còn là cách pha trà, cách sử dụng trà.\"<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Muỗng xúc trà Chasaku là dụng cụ đong trà truyền thống của Nhật Bản. 1 muỗng đầy chasaku = ~ 1g.<br>&nbsp;</p><p><br>&nbsp;</p>', 1),
(56, 4, 'Chổi pha trà matcha - Chasen', 'dc2.jpg', 46, 4, 295000, 295000, '2024-12-04 07:37:35', 50, '<p>Chổi Chasen là dụng cụ vô cùng quan trọng và cần thiết khi chế biến các món ngon từ matcha. Bởi vì chổi có vai trò quan trọng trong quá trình tạo bọt của trà xanh matcha. Giúp đánh tan hoàn toàn bột matcha và giúp matcha có hương vị thơm ngon gấp nhiều lần so với dùng muỗng ngoáy hoặc dùng máy đánh.&nbsp;</p><p>Trong trà đạo Nhật Bản, chổi chasen và matcha là cặp đôi không thể tách rời, được ví như như “chồng” và “vợ”.&nbsp;</p><p>Chổi Chasen của Matchashop cung cấp là loại lớn giúp dễ dàng đánh tan bột matcha. Giúp tạo lớp bọt mịn và dậy mùi thơm của trà matcha. Chổi có 120 chân, là số chân cao nhất của chổi chasen.<br>&nbsp;</p><p><br>&nbsp;</p>', '<p>Chổi Chasen là dụng cụ vô cùng quan trọng và cần thiết khi chế biến các món ngon từ matcha. Chổi chasen đóng vai trò quan trọng trong quá trình tạo bọt của trà xanh matcha, giúp đánh tan hoàn toàn bột matcha và giúp matcha có hương vị tuyệt vời.<br>&nbsp;</p><p><br>&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(6, 'khoanguyen', '$2y$10$YO9fd9Wdhed5mYcUFc5eTe5o7zrasZtl2x7Wt4J03im0NWaRisesu', 'Nguyễn Tuấn', 'avatar_it.png', 'abc@gmail.com', '0909155555', 'Ninh Kiều, Cần Thơ', 0, 1),
(7, 'khahi', '$2y$10$sF.yA6lAhvCE1vhwffwijuzA3JMoVhgnxkk.FdqXR4HVHlHdnXHzK', 'Lê Châu Khả Hi', 'user-default.png', 'hilckpc524@fpt.edu.vn', '0336216654', 'Kiên Giang', 0, 1),
(8, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'user-default.png', 'khoacn03@gmail.com', '0336216559', 'Cần Thơ', 1, 1),
(9, 'tranvana', '$2y$10$ts748iCUjwA5HpQBMLuROuAXa70addsKmfkMh9rYIw/PjhxLLwH8i', 'Trần Văn A', 'user-default.png', 'tranvana@gmail.com', '0909135969', 'Cái Răng, Cần Thơ', 0, 1),
(10, 'haohao', '$2y$10$gcBHpzElBGDkOv5EEzJFhuoireNk2HsaloJQLy2KHvzGqx6MIyYku', 'Mai Hảo Hảo', 'user-default.png', 'haomhpc07316@fpt.edu.vn', '0909135985', 'Ninh Kiều, Cần Thơ', 0, 1),
(11, 'tuankiet', '$2y$10$ENy4z0Infjac7VjlKYp2A.gqCBwc8N01tKGLT9A3buGdVoyd7sXnK', 'Đặng tuấn Kiệt', 'user-default.png', 'kietdtpc06764@fpt.edu.vn', '0909006764', 'Cần Thơ', 0, 1),
(12, 'khoanguyen111', '$2y$10$ZPAY2O7ntfQ5/Huv3dUAIuY4qHuPD/DpRxiw11TurgYr3hCrWfnv2', 'Nguyễn Lê Anh Khoa', 'khoanguyen.jpg', 'khoanlapc1234@gmail.com', '0336216546', 'Cần Thơ', 0, 1),
(13, 'khoanguyen001', '$2y$10$ptSvfsaT78h4LdZQNCrKdemlC.AqyZ/q5cudTk9/FKcbe6TtJDJAC', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoanla113@gmail.com', '0336216555', 'Can tho', 0, 1),
(15, 'toan', '$2y$10$rwdD7UlOPC2XUc4d3nJ/nO0THzotlhmrKekcbBynHxTqpOmFlN79a', 'Toàn', 'user-default.png', 'toan@gmail.com', '0336256555', 'Đại Học Cửu Long', 0, 1),
(16, 'songvi', '$2y$10$AUtQg3irAvwOP/ET.RlGueZAijPdfqeGCLAA5Th/AmI7hMPnstqv2', 'Nguyễn Song Vi', 'user-default.png', 'phamvi1506@gmail.com', '0931938602', 'Thủ Đức', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
