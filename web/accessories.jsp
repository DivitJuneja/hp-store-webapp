<!DOCTYPE html>
<%@include file="header.jsp" %>
<html lang="en">
<head>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</head>
<body>
     
<div id="Accessories" class="mt-5">
        <div class="container pt-lg-4 py-md-3 py-2">
         <div class="row mt-5">
            <div class="col-12">
                  <div class="text-center mb-4">
                <h2 class="fw-bold hding">Designed to Enhance Built to Perform</h2>
                <p class="fs-5 text-muted">HP accessories that balance durability and precision ? for every user</p>
                </div>
            </div>
         </div>
         <div class="row py-lg-5 py-md-3 py-2">
            <div class="col-12">
         <section class="py-5">
	<div class="container-fluid">
		<div id="owl-demo-2" class="owl-carousel owl-theme">

			<article class="thumbnail item">
				<a href="#!">
					<img src="images/access1.avif" class="img-responsive mb-2"/>
				</a>
				<div class="caption">
					<h4>HP 65W 4.5mm Non-EM AC Adapter</h4>
                                        <h6>Rs.1200 </h6>
					<a href="purchase.jsp?id=1116&price=1200" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

			<article class="thumbnail item">
				<a href="#!">
					<img src="images/pp.avif" class="img-responsive"/>
				</a>
				<div class="caption mt-5">
					<h4>HP Wireless Keyboard</h4>
                                        <h6>Rs.800 </h6>
					<a href="purchase.jsp?id=1117&price=800" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

			<article class="thumbnail item">
				<a href="#!">
					<img src="images/access3.avif" class="img-responsive" />
				</a>
				<div class="caption mt-5">
					<h4>HP M10 Wired Mouse</h4>
                                        <h6>Rs.300 </h6>
					<a href="purchase.jsp?id=1118&price=300" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

			<article class="thumbnail item">
				<a href="#!">
					<img src="images/access4.avif" class="img-responsive" />
				</a>
				<div class="caption mt-5">
					<h4>HP X Entry Backpack</h4>
                                        <h6>Rs.1100 </h6>
					<a href="purchase.jsp?id=1119&price=1100" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

			<article class="thumbnail item">
					<a href="#!">
					<img src="images/access5.avif" class="img-responsive" />
				</a>
				<div class="caption mt-5">
					<h4>HP USB-C 5-in-1 Hub</h4>
                                        <h6>Rs.2000 </h6>
					<a href="purchase.jsp?id=1120&price=2000" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

			<article class="thumbnail item">
				<a href="#!">
					<img src="images/access6.avif" class="img-responsive" />
				</a>
				<div class="caption mt-5">
					<h4>HP 320 FHD Webcam </h4>
                                        <h6>Rs.1500 </h6>
					<a href="purchase.jsp?id=1121&price=1500" class="btn btn-primary btn-block btn1">Purchase</a>
				</div>
			</article>

		</div><!-- #owl-demo-2 -->
	</div><!-- .container -->
</section>
</div>
</div>
</div>
</div>
<!-- owl carousel closed -->
<div id="extras">
<div class="container py-5">
  <div class="row text-center">
    <div class="col-md-6 col-lg-4 mb-4">
      <div class="card border-0 shadow">
        <img src="images/cartridge.webp" class="card-img-top" alt="HP Omen">
        <div class="card-body">
          <p class="text-muted fw-bold">HP 682 Original Ink Advantage Cartridge</p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-4 mb-4">
      <div class="card border-0 shadow">
        <img src="images/ink.webp" class="card-img-top" alt="HP Spectre">
        <div class="card-body">
          <p class="text-muted fw-bold">HP GT53 Original Ink Bottle</p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-4 mb-4 mx-auto">
      <div class="card border-0 shadow">
        <img src="images/pendrive.avif" class="card-img-top" alt="HP Pavilion">
        <div class="card-body">
          <p class="text-muted fw-bold">HP 886C 256GB OTG Flash Drive 3.2 Rock</p>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!-- extras closed -->
    <%@include file="footer2.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
   
    <script>
        jQuery(document).ready(function ($)
    {
        var owl = $("#owl-demo-2");
        owl.owlCarousel({
		autoplay: true,
		autoplayTimeout: 2000,
		autoplayHoverPause: true,
		items: 3,
		loop: true,
		center: false,
		rewind: false,
		mouseDrag: true,
		touchDrag: true,
		pullDrag: true,
		freeDrag: false,
		margin: 0,
		stagePadding: 0,
		merge: false,
		mergeFit: true,
		autoWidth: false,
		startPosition: 0,
		rtl: false,
		smartSpeed: 350,
		fluidSpeed: false,
		dragEndSpeed: false,
		responsive: 
        {
			0: {
				items: 1
				// nav: true
			},
			480: {
				items: 2,
				nav: false
			},
			768: {
				items: 3,
				// nav: true,
				loop: true
			},
			992: {
				items: 4,
				// nav: true,
				loop: true
			}
		},
		responsiveRefreshRate: 200,
		responsiveBaseElement: window,
		fallbackEasing: "swing",
		info: false,
		nestedItemSelector: false,
		itemElement: "div",
		stageElement: "div",
		refreshClass: "owl-refresh",
		loadedClass: "owl-loaded",
		loadingClass: "owl-loading",
		rtlClass: "owl-rtl",
		responsiveClass: "owl-responsive",
		dragClass: "owl-drag",
		itemClass: "owl-item",
		stageClass: "owl-stage",
		stageOuterClass: "owl-stage-outer",
		grabClass: "owl-grab",
		autoHeight: false,
		lazyLoad: false
	});

	$(".next").click(function () {
		owl.trigger("owl.next");
	});
	$(".prev").click(function () {
		owl.trigger("owl.prev");
	});
});

    </script>
    

</body>
</html>
