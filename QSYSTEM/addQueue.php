<!--<!DOCTYPE html>-->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <title>ADD</title>
    <style type="text/css">
        img {
            transition: transform 0.25s ease;
        }

        img:hover {
            -webkit-transform: scale(1.5);
            /* or some other value */
            transform: scale(1.5);
        }
    </style>


</head>

<?php
require './connect.php';

$sql_select = 'SELECT * from tbl_queue order by qnumber';
$stmt_s = $conn->prepare($sql_select);
$stmt_s->execute();

if (isset($_POST['submit'])) {
    echo "AfterSubmit";
    if (!empty($_POST['qnumber']) && !empty($_POST['pid'])) {
        echo 'oke' . $_POST['qnumber'];
        //require 'connect.php';
        
        $qstatus = "รอเข้ารับการรักษา";
        $sql = "INSERT into tbl_queue values (:qdate, :qnumber, :pid, :qstatus )";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':qdate', $_POST['qdate']);
        $stmt->bindParam(':qnumber', $_POST['qnumber']);
        $stmt->bindParam(':pid', $_POST['pid']);
        $stmt->bindParam(':qstatus',$qstatus); 
        

       
        try {
            if ($stmt->execute()):
                $message = 'Successfully add new food';
            else:
                $message = 'Fail to add new food';
            endif;
            echo $message;
        } catch (PDOException $e) {
            echo 'Fail! ' . $e;
        }

        $conn = null;
    }

    //header("Location:index.php");
}
?>



    <div class="container">
      <div class="row">
        <div class="col-md-4"> <br>
            <h3>ฟอร์มเพิ่มข้อมูลคิว</h3>
            <form  action="addQueue.php" method="POST" enctype="multipart/form-data">
            <br>
            <input type="date"  name="qdate"> 
            <br> <br>
            <input type="text" placeholder="หมายเลขคิว" name="qnumber">
            <br> <br>
            <input type="number" placeholder="รหัสบัตรประชาชน" name="pid">
            <br> <br>   
            
            <input type="submit" value="Submit" name="submit" />
            </form>
            </div>
        </div>
    </div>
</body>
</html>