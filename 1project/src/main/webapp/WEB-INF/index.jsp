<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<script>
function myFunction() {$('#exampleModalCenter').modal('show');}
</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JewellaryProject</title>
    <link rel="shortcut icon" href="img/favicon.ico" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/style.css">

</head>

<body onclick="myFunction()">
    <!-- Button trigger modal -->
	<div class="right"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
	  Login | SignUp | Explore
	</button>
	</div>
	<!-- CAROUSAL -->
    <div id="carouselExampleFade" class="carousel slide .carousel-fade" data-ride="carousel" data-interval="3000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" style="text-align:center;background-color: black;height:800px;line-height:800px" ;>
                <img class="d-block w-100 " src="img/diamond_gif.gif" alt="First slide" style="width:200px!important;margin:0 auto;">
                <h1>Welcome...</h1>
                <h3>To the Online Jewelry Point !</h3>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/jewellary_4.jpg" alt="Second slide" style=" height: 800px;">
                <div class="carousel-caption d-none d-md-block">
                    <h1>JEWELRY...</h1>
                    <h3>with a passion !</h3>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/carousal1.jpg" alt="Third slide" style="height: 800px;">
                <div class="carousel-caption d-none d-md-block">
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <hr>

    <!-- SECTION TWO -->

    <div class="container center">
        <h1 class="white">POPULAR COLLECTIONS</h1>
        <img src="img/title-bg.png">
        <div class="row product">
            <div class="col-3 containerA">
                <img src="img/pro1.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Epic Style</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro2.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Heritage</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro3.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Variety</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro4.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Belief</div>
                </div>
            </div>
        </div>
        <div class="row product">
            <div class="col-3 containerA">
                <img src="img/pro5.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Elegant</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro6.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Lustre</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro7.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Trendy</div>
                </div>
            </div>
            <div class="col-3 containerA">
                <img src="img/pro8.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Customize</div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!-- section three -->
    <div class="container fixbg">
        <h1>CUSTOMIZE YOUR JEWELLARY AS PER YOUR MOOD !</h1>
        <img src="img/title-bg.png">
        <div class="row ">
            <div class="col-5 fixbgcol">
                <img src="img/1.jpg">
            </div>
            <div class="col-5 fixbgcol">
                <img src="img/2.jpg">
            </div>
        </div>
    </div>
    <hr>
    <!-- section 4 -->
    <div class="container storeBest">
        <h1>Best of our store !</h1>
        <img src="img/title-bg.png">
        <div class="row rowBest">
            <div class="col-3 containerA">
                <img src="img/thum1.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Love $569</div>
                </div>
                <p>Love
                    <b> $569 </b>
                    <strike>$1200</strike>
                </p>
            </div>
            <div class="col-3 containerA">
                <img src="img/thum2.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Twist $999</div>
                </div>
                <p>Twist
                    <b> $999 </b>
                    <strike>$1900</strike>
                </p>

            </div>
            <div class="col-3 containerA">
                <img src="img/thum3.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Turn $1299</div>
                </div>
                <p>Turn
                    <b> $1299 </b>
                    <strike>$2500</strike>
                </p>

            </div>
            <div class="col-3 containerA">
                <img src="img/thum4.jpg" class="image" style="width:100%">
                <div class="middle">
                    <div class="text">Maze $699</div>
                </div>
                <p>Maze
                    <b>$699 </b>
                    <strike>$1300</strike>
                </p>

            </div>
        </div>
    </div>
    <!-- SECTION FIVE -->

    <div class="container  storeBest">
        <h1>Shop by category !</h1>
        <img src="img/title-bg.png">
        <div class="row category">
            <div class="col-2">
                <img src="img/thum-1.jpg">
                <div class="gold">Earrings</div>
            </div>
            <div class="col-2">
                <img src="img/thum-2.jpg">
                <div class="gold">Ring</div>
            </div>
            <div class="col-2">
                <img src="img/thum-3.jpg">
                <div class="gold">Necklace</div>
            </div>
            <div class="col-2">
                <img src="img/thum-4.jpg">
                <div class="gold">Bangles</div>
            </div>
            <div class="col-2">
                <img src="img/thum-5.jpg">
                <div class="gold">Set</div>
            </div>
        </div>
    </div>
    <hr>
    <!-- SECTION SIX -->

    <div class="container  storeBest">
        <h1>Latest jewelry collection!</h1>
        <img src="img/title-bg.png">
        <div class="row category2">
            <div class="col-3">
                <img src="img/img1.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-8.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-3.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-4.jpg">
            </div>
        </div>
        <div class="row category2">
            <div class="col-3">
                <img src="img/img-5.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-6.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-7.jpg">
            </div>
            <div class="col-3">
                <img src="img/img-9.jpg">
            </div>
        </div>
    </div>
    </div>
    <hr>

    
    <!-- SECTION SEVEN - Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle" style="color:black;">Welcome to Online Jewelry Point!What do you want to do today?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <h3><a href="/register">Login</a>  | <a href="/register"> Sign-Up </a> |  <a href="/products">Explore </a> </h3> <br>
      <p style="color:black;">Change your language to:
      <a href="/hindi">Hindi</a>  | <a href="/"> Odia </a> |  <a href="korean">Korean </a>
      <h4><a href="https://github.com/archanapanda95014/SpringMVC.git" target="_blank">GITHUB LINK</a>	 </h4>  |
      <h4><a href="https://youtu.be/t-iaRxypr0A" target="_blank">Video about the project... Must see !</a></h4>
      </div>
                 
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


    <div class="spacer"></div>
</body>

</html>