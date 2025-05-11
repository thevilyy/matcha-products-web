<?php
    class WarehousemModel {
        

        public function select_all_warehouse() {
            $sql = "SELECT * FROM warehouse ORDER BY id DESC";

            return pdo_query($sql);
        }


        public function insert_warehouse($name, $price, $quantity) {
            $sql = "INSERT INTO warehouse 
           (name, price, quantity)
            VALUES (?,?,?)";

            pdo_execute($sql, $name, $price, $quantity);
        }

        public function delete_warehouse($id) {
            $sql = "DELETE FROM warehouse WHERE id = ?";
            pdo_execute($sql, $id);
        }

                // Kiểm tra nếu sản phẩm đã có trong kho
        public function get_product_by_name($name) {
            $sql = "SELECT * FROM warehouse WHERE name = ?";
            return pdo_query_one($sql, $name);
        }

        // Cập nhật số lượng sản phẩm trong kho
        public function update_product_quantity($name, $quantity) {
            $sql = "UPDATE warehouse SET quantity = ? WHERE name = ?";
            pdo_execute($sql, $quantity, $name);

        }
    }

    $WarehousemModel = new WarehousemModel();
?>