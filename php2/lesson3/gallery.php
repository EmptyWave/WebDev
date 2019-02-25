<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
  if ($_POST['token'] !== $_SESSION['lastToken'])
  {
    $date = date("Y_m_d_H_i_s");
    $log = LOG_DIR.LOG_NAME.LOG_FORMAT;
    $newLog = LOG_DIR.LOG_NAME.$date.LOG_FORMAT;
    $newFileName = IMAGE_DIR . $_FILES['picture']['name'];
    $tmpFileName = $_FILES['picture']['tmp_name'];

    if (file_exists($log)) {
      if (sizeof(file($log)) >= 10 ){
        rename($log,$newLog);
        $file = fopen($log,"w+");
      }else{
        $file = fopen($log,"a+");
      }
    } else{
      $file = fopen($log,"w+");
    }

    if (!file_exists($newFileName)){
      if (!@copy($tmpFileName, $newFileName)) {
        echo "Что-то пошло не так";
        fwrite($file,"{$date} Load failed \n");
      } else {
        $_SESSION['msg'] = "Файл успешно загружен!";

        $name = clearStr($_FILES['picture']['name']);
        $link = clearStr($newFileName);
        $size = clearStr($_FILES['picture']['size']);
        $views = clearStr('0');
        $sql = "INSERT INTO images(name, link, size, views) VALUES ('$name', '$link', '$size', '$views')";
        mysqli_query(connect(), $sql);

        fwrite($file,"{$date} File successfully uploaded - {$newFileName} \n");
      }
    }else{
      fwrite($file,"{$date} Something gone wrong \n");
    }
    fclose($file);
    $_SESSION['lastToken'] = $_POST['token'];
  }
  //header('Location: '.$_SERVER['HTTP_REFERER']);
}

function getImage($id,$link,$name,$views){
  $content = "<div class='galleryImgContainer'>";
  $content .= "<img data-id=\"{$id}\" 
                    src=\"{$link}\" 
                    class=\"galleryMinImg\" 
                    alt=\"{$name}\" 
                    data-full_image_url=\"{$link}\" 
                    data-views=\"{$views}\">";
  $content .= "<p><i class=\"fas fa-eye\"></i> {$views}</p>";
  $content .= "</div>";

  return $content;
}
?>

