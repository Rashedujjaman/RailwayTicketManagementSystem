<?php
session_start();
include('assets/inc/config.php'); // get configuration file

if (isset($_POST['pass_login'])) {
    $pass_email = $_POST['pass_email'];
    $pass_pwd = sha1(md5($_POST['pass_pwd'])); // double encrypt to increase security

    $stmt = $mysqli->prepare("SELECT pass_email ,pass_pwd , pass_id FROM orrs_passenger WHERE pass_email=? and pass_pwd=? ");
    $stmt->bind_param('ss', $pass_email, $pass_pwd);
    $stmt->execute();
    $stmt->bind_result($pass_email, $pass_pwd, $pass_id);
    $rs = $stmt->fetch();
    $_SESSION['pass_id'] = $pass_id;

    if (!filter_var($pass_email, FILTER_VALIDATE_EMAIL)) {
        $err = "Invalid Email Format";
    } else {
        $check_query = mysqli_query($connection, "SELECT * FROM orrs_passenger WHERE pass_email='$pass_email'");
        $check_res = mysqli_num_rows($check_query);

        if ($check_res > 0) {
            $data = mysqli_fetch_array($check_query);
            $pass_fname = $data['pass_fname'];
            $_SESSION['pass_fname'] = $pass_fname;

            $otp = rand(10000, 99999);
            include_once("SMTP/class.phpmailer.php");
            include_once("SMTP/class.smtp.php");
            $message = '<div>
            <p><b>Hello!</b></p>
            <p>You are receiving this email because we received an OTP request for your account.</p>
            <br>
            <p>Your OTP is: <b>' . $otp . '</b></p>
            <br>
            <p>If you did not request OTP, no further action is required.</p>
            </div>';
            $pass_email = $pass_email;
            $mail = new PHPMailer;
            $mail->IsSMTP();
            $mail->SMTPAuth = true;
            $mail->SMTPSecure = "tls";
            $mail->Host = 'smtp.gmail.com';
            $mail->Port = 587;
            $mail->Username = "dhurgashiniveerasamy15@gmail.com";
            $mail->Password = "ywuy nrkg ayyc rryf";
            $mail->FromName = "ORRS";
            $mail->AddAddress($pass_email);
            $mail->Subject = "OTP";
            $mail->isHTML(TRUE);
            $mail->Body = $message;

            if ($mail->send()) {
                $insert_otp_query = mysqli_query($connection, "INSERT INTO orrs_otp_check (otp, is_expired) VALUES ('$otp', '0')");

                if ($insert_otp_query) {
                    $_SESSION['pass_email'] = $pass_email;
                    $_SESSION['otp'] = $otp;
                    header('location:otpverify.php');
                    exit();
                } else {
                    $msg = "Error inserting OTP into the database: " . mysqli_error($connection);
                }
            } else {
                $msg = "Email not delivered: " . $mail->ErrorInfo;
            }
        } else {
            $msg = "Invalid Email";
        }
    }
    $stmt->close();
    mysqli_close($connection);
}
?>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    <title>Online Railway Reservation System</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="assets/css/app.css" type="text/css"/>
    <!--Trigger Sweet Alert-->
    <?php if(isset($error)) {?>
    <!--This code for injecting an alert-->
      <script>
            setTimeout(function () 
            { 
              swal("Failed!","<?php echo $error;?>!","error");
            },
              100);
      </script>
					
			<?php } ?>
  </head>
  <body class="be-splash-screen">
    <div class="be-wrapper be-login">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="splash-container">
            <div class="card card-border-color card-border-color-success">
              <div class="card-header"><img class="logo-img" src="assets/img/logo-xx.png" alt="logo" width="{conf.logoWidth}" height="27"><span class="splash-description">Please enter your user information.</span></div>
              <div class="card-body">

              <!--Login Form-->
                <form method ="POST">
                  <div class="login-form ">

                    <div class="form-group">
                      <input class="form-control" name="pass_email" type="text" placeholder="Email" autocomplete="off" required>
                    </div>

                    <div class="form-group">
                      <input class="form-control" name="pass_pwd" type="password" placeholder="Password" required>
                    </div>

                    <div class="form-group row login-tools">
                      <div class="col-6 login-remember">
                        <div class="custom-control custom-checkbox">
                          <input class="custom-control-input" type="checkbox" id="check1">
                          <label class="custom-control-label" for="check1">Remember Me</label>
                        </div>
                      </div>
                      <div class="col-6 login-forgot-password"><a href="pass-pwd-forgot.php">Forgot Password?</a></div>
                    </div>

                    <div class="form-group row login-submit">
                      <div class="col-6"><a class="btn btn-danger btn-xl" href="pass-signup.php">Register</a></div>
                      <div class="col-6"><input type = "submit" name ="pass_login" class="btn btn-success btn-xl" value ="Log In"></div>
                    </div>
                    
                  </div>
                </form>
                <!--End Login-->
              </div>
            </div>
            <div class="splash-footer"><a href = "index.php">Home</a></div>

            <div class="splash-footer">&copy; 2019 - <?php echo date ('Y');?> Online Railway Reservation System | Developed By Group 13</div>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="assets/js/app.js" type="text/javascript"></script>
    <script src="assets/js/swal.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      });
      
    </script>
  </body>

</html>