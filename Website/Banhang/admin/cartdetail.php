<?php 
    include 'header.php';

    if (isset($_COOKIE["user"])) {
        $user = $_COOKIE["user"];
        foreach (selectAll("SELECT * FROM taikhoan WHERE taikhoan='$user'") as $row) {
            $permission = $row['phanquyen'];
        }
        if ($permission==1) {
            if (isset($_GET["id"])) {
                foreach (selectAll("SELECT * FROM ctdonhang WHERE id_donhang={$_GET['id']}") as $item) {
                    $id_donhang = $item['id_donhang'];
                    $id_sanpham = $item['id_sanpham'];
                    $soluong = $item['soluong'];
                    $gia = $item['gia'];
                }
                foreach (selectAll("SELECT * FROM donhang WHERE id={$_GET['id']}") as $items) {
                    $id_taikhoan = $items['id_taikhoan'];
                    $tongtien = $items['tongtien'];
                    $diachi = $items['diachi'];
                    $status = $items['status'];
                }
                foreach (selectAll("SELECT * FROM taikhoan WHERE id='$id_taikhoan'") as $item3) {
                    $hoten = $item3['hoten'];
                    $taikhoan = $item3['taikhoan'];
                }
            }
            
        ?>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row ">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                <h4 class="card-title addfont">Order Details</h4>
                                <div class="d-flex addfont">
                                    <div class="col-6">
                                        <div class="form-group">
                                        <label for="exampleInputName1">Order ID</label>
                                        <input type="text" name = "ten" value="<?= $id_donhang ?>" required class="form-control text-light" placeholder="Enter first and last name">
                                        </div>

                                        <div class="form-group ">
                                        <label for="exampleInputName1">Total Money</label>
                                        <input type="text" name ="email" value="<?= number_format($tongtien)?>đ" required class="form-control text-light" placeholder="Enter email">
                                        </div>
                                        
                                        <div class="form-group ">
                                        <label for="exampleInputName1">Status</label>
                                        <?php 
                                            if ($status==1) {
                                                ?>
                                                <input type="text" value="Wait for confirmation" required class="form-control text-light" >
                                            <?php 
                                            }else if ($status==2) {
                                                ?>
                                                <input type="text" value="Delivering" required class="form-control text-light" >
                                            <?php 
                                            }else if ($status==3) {
                                                ?>
                                                <input type="text" value="Delivered" required class="form-control text-light" >
                                            <?php 
                                            }else if ($status==4) {
                                                ?>
                                                <input type="text" value="Cancelled" required class="form-control text-light">
                                            <?php
                                            }
                                            ?>
                                        </div>
                                        
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                        <label for="exampleInputName1">Customer name</label>
                                        <input type="text" name = "ten" value="<?= $hoten ?>" required class="form-control text-light" placeholder="Enter the fullname">
                                        </div>

                                        <div class="form-group ">
                                        <label for="exampleInputName1">Customer Accounts</label>
                                        <input type="text" name ="email" value="<?= $taikhoan ?>" required class="form-control text-light" placeholder="Enter email">
                                        </div>
                                        <div class="form-group ">
                                        <label for="exampleInputName1">Delivery Address</label>
                                        <input type="text" name ="email" value="<?= $diachi ?>" required class="form-control text-light" placeholder="Enter email">
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="addfont" style="width: 20px">Numerical order</th>
                                                <th class="addfont" style="width: 400px" >Product's name</th>
                                                <th class="addfont"  >Category</th>
                                                <th class="addfont" > Price </th>
                                                <th class="addfont" >Image product</th>
                                                <th class="addfont" >Quantity</th>
                                                <th class="addfont" >See details</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <?php 
                                        $stt=1;
                                        $item_per_page = !empty($_GET['per_page'])?$_GET['per_page']:4;
                                        $current_page = !empty($_GET['page'])?$_GET['page']:1;
                                        $offset = ($current_page - 1) * $item_per_page;
                                        $numrow = rowCount("SELECT * FROM ctdonhang WHERE id_donhang = {$_GET['id']}");
                                        $totalpage = ceil($numrow / $item_per_page);
                                        foreach (selectAll("SELECT * FROM ctdonhang WHERE id_donhang={$_GET['id']} LIMIT $item_per_page OFFSET $offset") as $item4) {
                                            $id_sanpham = $item4['id_sanpham'];
                                            $soluong = $item4['soluong'];
                                            $gia = $item4['gia'];
                                            foreach (selectAll("SELECT * FROM sanpham INNER JOIN danhmuc ON sanpham.id_danhmuc = danhmuc.id_dm WHERE id = '$id_sanpham'") as $row) {
                                            ?>
                                                <tr class="addfont">
                                                    <td><?= $stt++ ?></td>
                                                    <td>
                                                    <span><?= $row['ten'] ?></span>
                                                    </td>
                                                    <td>
                                                    <?= ($row['danhmuc']) ?>
                                                    </td>
                                                    <td><?= number_format($gia) ?>đ</td>
                                                    <td>
                                                    <img src="../img/product/<?= $row['anh1'] ?>" width="100" alt="">
                                                    <img src="../img/product/<?= $row['anh2'] ?>" width="100" alt="">
                                                    <img src="../img/product/<?= $row['anh3'] ?>" width="100" alt="">
                                                    </td>
                                                    <td><?= $soluong ?></td>
                                                    </td>
                                                    <td>
                                                    <a type="button" class="btn btn-primary btn-icon-text" href="../detail.php?id=<?= $item4['id_sanpham'] ?>">
                                                    <i class="mdi mdi-file-check btn-icon-prepend"></i> See </a>
                                                    </td>
                                                </tr>
                                            <?php
                                                }
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                    
                                    <div class="col-lg-12">
                                      <div class="pageination">
                                          <nav aria-label="Page navigation example">
                                              <ul class="pagination justify-content-center">
                                                  <?php for($num = 1; $num <=$totalpage;$num++) { ?>
                                                      <?php 
                                                          if ($num != $current_page){ 
                                                      ?>
                                                          <?php if ($num > $current_page-3 && $num < $current_page+3){ ?>
                                                          <li class="page-item"><a class="btn btn-outline-secondary" href="?id=<?= $id_donhang?>&per_page=<?=$item_per_page?>&page=<?=$num?>"><?=$num?></a></li>
                                                          <?php 
                                                        } ?>
                                                      <?php 
                                                      } 
                                                      else{ 
                                                      ?>
                                                          <strong class="page-item"><a class="btn btn-outline-secondary"><?=$num?></a></strong>
                                                      <?php 
                                                      }
                                                  } 
                                                  ?>
                                          </nav>
                                      </div>
                                  </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <script src="./js/search.js?v=<?php echo time()?>"></script>
            <?php
        }
    }
 include 'footer.php';
 ?>

