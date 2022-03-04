<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Irish+Grover' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=La+Belle+Aurore' rel='stylesheet' type='text/css'>
    <link href="../css/screen.css" type="text/css" rel="stylesheet" />
    <link href="../css/sidebar.css" type="text/css" rel="stylesheet" />
    <link href="../css/blog.css" type="text/css" rel="stylesheet" />
    <title>Daniel Ayala Cantador</title>
</head>
<body>
    <section id="wrapper">
        <?php
            include "header.html";
        ?>
        <section class="main-col">
            <?php
            foreach ($data as $elemento){
                ?>
                <article class="blog">

                <div class="date">
                    <time datetime=" "><?php echo $elemento["created_at"]; ?></time>
                </div>

                <header>
                    <h2><a href="show_sb.php?id=n"><?php echo $elemento["title"]; ?></a></h2>
                </header>

                <img src="../img/<?php echo $elemento["image"]?>" >

                <div class="snippet">
                    <p><?php echo $elemento["content"]; ?></p>
                    <p class="continue"><a href="#">Continue reading...</a></p>
                </div>

                <footer class="meta">
                    <p>Comments: <a href="#"> Numero comentarios </a></p>
                        <p>Posted by <span class="highlight"><?php echo $elemento["author"]; ?></span> at <?php echo $elemento["created_at"]; ?></p>
                        <p>Tags: <span class="highlight"><?php echo $elemento["tags"]; ?></span></p>
                </footer>
                </article>                     
                <?php
            }
            ?>
        </section>
        <?php
            include "side_bar.html";
            include "footer.html";
        ?>
    </section>
</body>
</html>