<?php
class Product extends Db
{
    //Hàm lấy tất cả sản phẩm
    public function getAllProducts()
    {
        $sql = self::$connection->prepare("SELECT * FROM products ORDER BY created_at DESC");
        $sql->execute();
        $items = array();
        $items = $sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $items;
    }
}