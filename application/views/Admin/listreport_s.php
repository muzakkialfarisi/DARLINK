<div class="container-fluid my-3">
    <a class="btn border border-dark bg-light text-dark mr-2" href="<?= base_url(); ?>admin/v_listreport_s">Service</a>
    <a class="btn border border-dark bg-light text-dark mr-2" href="<?= base_url(); ?>admin/v_listreport_co">Feed/Dist</a>
    <div name="alert" class="mt-3">
        <?php if ($this->session->flashdata('success')) : ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Data <strong>berhasil</strong> <?= $this->session->flashdata('success'); ?>.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <?php endif; ?>
    </div>
    <nav class="navbar">
        <a class="navbar-brand"></a>
        <form action="<?php echo base_url("admin/search_report_s"); ?>" method="post">
            <div class="form-row">
                <div class="form-group col">
                    <select class="form-control form-control-sm" name="status">
                        <option value="">Jenis...</option>
                        <option value="0">Wait</option>
                        <option value="2">Decline</option>
                        <option value="1">Done</option>
                    </select>
                </div>
                <div class="form-group col">
                    <input type="text" class="form-control form-control-sm" name="pelapor" placeholder="Pelapor">
                </div>
                <div class="form-group col">
                    <input type="text" class="form-control form-control-sm" name="tanggal" placeholder="Tanggal" id="datepicker">
                </div>
                <div class="">
                    <button type="submit" class="btn btn-primary fas fa-search"></button>
                </div>
            </div>
        </form>
    </nav>
    <table class="table table-striped table-sm text-center" style="font-size:12px">
        <thead class="text-light" style="background-color:#84142d">
            <tr >
                <td scope="col">Aksi</td>
                <td scope="col">Status</td>
                <td scope="col">Tipe Report</td>
                <td scope="col">No.Service</td>
                <td scope="col">No.Internet</td>
                <td scope="col">Nama ODP</td>
                <td scope="col">Port ODP</td>
                <td scope="col">QR ODP</td>
                <td scope="col">QR Dropcore</td>
                <td scope="col">Nama OLT</td>
                <td scope="col">Slot/Port OLT</td>
                <td scope="col">SN ONT</td>
                <td scope="col">Pelapor</td>
                <td scope="col">Tanggal</td>
            </tr>
        </thead>
        <tbody id="myTable">
        <?php 
            // $i = 0;
            foreach($dataReport as $data){
            // $i = $i + 1;
        ?>
            <tr>
            <td style="font-size:13px;padding-right:0px">
                <div class="input-group" style="width:5px">
                    <button style="font-size:12px" class="btn btn-outline-secondary dropdown-toggle btn-sm" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                    <div style="font-size:12px" class="dropdown-menu">
                        <a class="dropdown-item" href="<?php $id = $data['id']; $req = 1; echo base_url("admin/aksi_report_s/$id/$req"); ?>">Done</a>
                        <a class="dropdown-item" href="<?php $id = $data['id']; $req = 2; echo base_url("admin/aksi_report_s/$id/$req"); ?>">Decline</a>
                        <a class="dropdown-item" href="<?php $id = $data['id']; $req = 0; echo base_url("admin/aksi_report_s/$id/$req"); ?>">Wait</a>
                    </div>
                </div>
            </td>
            <td>
            <?php
                if ($data['status'] == 1){
                    echo "<div class='bg-success py-1' style='font-size:13px'>Done</div>";                        
                }else if ($data['status'] == 0){
                    echo "<div class='bg-warning py-1' style='font-size:13px'>Waiting</div>";
                }else{
                    echo "<div class='bg-secondary text-light py-1' style='font-size:13px'>Declined</div>";
                }
                ?>
            </td>
            <td><?= $data['jenis'];?></td>
            <td><?= $data['numbservice'];?></td>
            <td><?= $data['numbservice2'];?></td>
            <td><?= $data['namaodp'];?></td>
            <td><?= $data['portodp'];?></td>
            <td><?= $data['qrodp'];?></td>
            <td><?= $data['qrdropcore'];?></td>
            <td><?= $data['hostnamegpon'];?></td>
            <td><?= $data['slotgpon'];?> / <?= $data['portgpon'];?></td>
            <td><?= $data['sn'];?></td>
            <td><?= $data['pelapor'];?></td>
            <td> <?php echo date("d-m-y", strtotime($data['tanggal']));?></td>
            </tr>
        <?php }?>
        </tbody>	
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>