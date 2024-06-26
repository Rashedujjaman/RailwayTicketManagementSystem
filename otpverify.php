<html>  
<head>  
    <title>OTP Verify</title>  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
</head>
<style>
 .box
 {
  width:100%;
  max-width:600px;
  background-color:#f9f9f9;
  border:1px solid #ccc;
  border-radius:5px;
  padding:16px;
  margin:0 auto;
 }
 .error
{
  color: red;
  font-weight: 700;
} 
</style>
<?php
session_start();
if(empty($_SESSION['pass_fname']))
{
  header('location:pass-login.php');
}
include_once('assets/inc/config.php');
if(isset($_REQUEST['otp_verify']))
{
  $otp = $_REQUEST['otp'];
  $select_query = mysqli_query($connection,"select * from orrs_otp_check where otp='$otp' and is_expired!=1 and NOW()<=DATE_ADD(create_at,interval 5 minute)");
  $count = mysqli_num_rows($select_query);
  if($count>0)
  {
    $select_query = mysqli_query($connection, "update orrs_otp_check set is_expired=1 where otp='$otp'");
    header('location:pass-dashboard.php');
  }
  else
  {
    $msg = "Invalid OTP!";
  }
}
?>
<body>  
    <div class="container">  
    <div class="table-responsive">  
    <h3 align="center">Login Form</h3><br/>
    <div class="box">
     <form method="post" >  
       <div class="form-group">
       <label for="otp">Enter OTP</label>
       <input type="text" name="otp" id="otp" placeholder="One Time Password" required 
       data-parsley-type="otp" data-parsley-trigg
       er="keyup" class="form-control"/>
      </div>
      <div class="form-group">
       <input type="submit" id="submit" name="otp_verify" value="Submit" class="btn btn-success" />
       </div>
       <p class="error"><?php if(!empty($msg)){ echo $msg; } ?></p>
     </form>
     </div>
   </div>  
  </div>
 </body>  
</html>  
