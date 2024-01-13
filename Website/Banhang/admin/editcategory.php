<?php 
    include 'header.php';
    if (isset($_COOKIE["user"])) {
        $user = $_COOKIE["user"];
        foreach (selectAll("SELECT * FROM taikhoan WHERE taikhoan='$user'") as $row) {
            $permission = $row['phanquyen'];
        }
        if ($permission==1) {
            if (isset($_GET["id"])) {
                foreach (selectAll("SELECT * FROM danhmuc WHERE id_dm={$_GET["id"]}") as $item) {
                    $tendm = $item['danhmuc'];
                };
            }
            if (isset($_POST['sua'])) {
                $danhmuc = $_POST["danhmuc"];
                if(rowCount("SELECT * FROM danhmuc WHERE danhmuc='$danhmuc'")>0){
                    echo "<script>alert('Category already exists!')</script>";
                }else{
                    selectAll("UPDATE danhmuc SET danhmuc='$danhmuc' WHERE id_dm={$_GET["id"]}");
                    header('location:category.php');
                }
                
            }
            ?>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row ">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body addfont">
                                <h4 class="card-title">Product portfolio </h4>
                                <div class="table-responsive">
                                <form action="" method="post" class="card-body">
                                    <div class="form-group">
                                    <input type="text" value="<?= $tendm ?>" class="form-control text-light" name="danhmuc" required placeholder="Product portfolio" >
                                    <button type="submit" class="btn btn-success btn-fw" style=" margin-top:30px;" name="sua">Edit Category</button>
                                    </div>
                                </form>
                                </div>
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




