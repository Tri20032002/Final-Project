<?php 
    include 'header.php';
    // include '../connect.php';
    if (isset($_COOKIE["user"])) {
        $user = $_COOKIE["user"];
        foreach (selectAll("SELECT * FROM taikhoan WHERE taikhoan='$user'") as $row) {
            $permission = $row['phanquyen'];
        }
        if ($permission==1) {
            if (isset($_POST['them'])) {
                $ten = $_POST["ten"];
                $id_danhmuc = $_POST["danhmuc"];
                $manhinh = $_POST["manhinh"];
                $hedieuhanh = $_POST["hedieuhanh"];
                $cpu = $_POST["cpu"];
                $gia = $_POST["gia"];
                $anh1 = $_FILES['anh1']['name'];
                $tmp1 = $_FILES['anh1']['tmp_name'];
                $type1 = $_FILES['anh1']['type'];
                $anh2 = $_FILES['anh2']['name'];
                $tmp2 = $_FILES['anh2']['tmp_name'];
                $type2 = $_FILES['anh2']['type'];
                $anh3 = $_FILES['anh3']['name'];
                $tmp3 = $_FILES['anh3']['tmp_name'];
                $type3 = $_FILES['anh3']['type'];
                $chitiet = $_POST["chitiet"];
                $mota = $_POST["mota"];
                $dir = '../img/product/';
                move_uploaded_file($tmp1, $dir . $anh1);
                move_uploaded_file($tmp2, $dir . $anh2);
                move_uploaded_file($tmp3, $dir . $anh3);
                
                selectAll("INSERT INTO sanpham VALUES(NULL,$id_danhmuc,'$ten','$manhinh','$hedieuhanh','$cpu',$gia,'$anh1','$anh2','$anh3','$chitiet','$mota',0,1)");
                header('location:product.php');
            }
        ?>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row ">
                        <div class="col-12 grid-margin">
                        <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Add Products</h4>
                    <form class="forms-sample" action="" method="post" enctype="multipart/form-data">

                      <div class="form-group">
                        <label for="exampleInputName1">Name Products</label>
                        <input type="text" name = "ten" required class="form-control text-light" placeholder="Enter the product name">
                      </div>

                      <div class="form-group">
                        <label for="exampleInputName1">Price</label>
                        <input type="number" name ="gia" required class="form-control text-light" placeholder="Enter the selling price">
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail3">Category</label>
                        <select required name="danhmuc" id="input" class="form-control text-light">
                        <?php
                        foreach (selectAll("SELECT * FROM danhmuc ") as $item) {
                        ?>
                            <option value="<?= $item['id_dm'] ?>"><?= $item['danhmuc'] ?></option>
                        <?php
                        }
                        ?>
                        </select>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputName1">Screen Size</label>
                        <input type="text" name="manhinh" required class="form-control text-light" placeholder="Enter screen size">
                      </div>

                      <div class="form-group">
                        <label for="exampleInputName1">Operating system</label>
                        <input type="text" name ="hedieuhanh" required class="form-control text-light" placeholder="Enter the operating system">
                      </div>

                      <div class="form-group">
                        <label for="exampleInputName1">CPU</label>
                        <input type="text"  name ="cpu" required class="form-control text-light" placeholder="Enter CPU type">
                      </div>

                      <div class="form-group">
                        <label>Image product</label>
                        <input type="file" name="anh1" class="form-control">
                        <input type="file" name="anh2" class="form-control">
                        <input type="file" name="anh3" class="form-control">
                      </div>

                      <div class="form-group">
                        <label for="exampleTextarea1">Short description</label>
                        <textarea type="text" name ="mota" required class="form-control text-light" rows="3" style="line-height: 2" placeholder="Enter a brief description"></textarea>
                      </div>

                      <div class="form-group">
                        <label for="exampleTextarea1">Detail</label>
                        <textarea type="text" name ="chitiet" required class="form-control text-light" style="line-height: 2" rows="6" placeholder="Enter details"></textarea>
                      </div>
                      
                      <button type="submit" name="them" class="btn btn-primary mr-2">Add Product</button>
                      <a class="btn btn-dark" href="product.php" >Cancel</a>
                    </form>
                  </div>
                </div>
                        </div>
                    </div>
                </div>
            <?php
        }
    }
    include 'footer.php';
?>