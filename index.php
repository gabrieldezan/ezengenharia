<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home | EZ Engenharia</title>
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">

    <?php /*CSS*/
    include('php/css.php');
    ?>

</head>

<body>

    <div class="preloader">
        <img src="assets/images/logo.png" class="preloader__image" alt="">
    </div><!-- /.preloader -->

    <div class="page-wrapper">

        <?php /*MENU*/
        include('php/menu.php');
        ?>

        <!--Main Slider Start-->
        <section class="main-slider">
            <div class="swiper-container thm-swiper__slider" data-swiper-options='{"slidesPerView": 1, "loop": true,
            "effect": "fade",
            "pagination": {
            "el": "#main-slider-pagination",
            "type": "bullets",
            "clickable": true
            },
            "navigation": {
            "nextEl": ".banner-slider-button-next",
            "prevEl": ".banner-slider-button-prev",
            "clickable": true
            },
            "autoplay": {
            "delay": 5000
            }}'>

                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="image-layer" style="background-image: url(assets/images/main-slider/slider-1-1.jpg);"></div>
                        <div class="container">
                            <div class="swiper-slide-inner">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <h2>Build Everything <br> With Passion</h2>
                                        <a href="sobre.php" class="thm-btn">get to know us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="image-layer" style="background-image: url(assets/images/main-slider/slider-1-2.jpg);"></div>
                        <div class="container">
                            <div class="swiper-slide-inner">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <h2>Build Everything <br> With Passion</h2>
                                        <a href="sobre.php" class="thm-btn">get to know us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="swiper-pagination" id="main-slider-pagination"></div>
                <div class="banner-slider-nav">
                    <div class="banner-slider-button-prev"><span class="flaticon-right-arrow"></span></div>
                    <div class="banner-slider-button-next"><span class="flaticon-right-arrow"></span> </div>
                </div>
            </div>
        </section>

         <!-- Áreas de Atuação -->
         <section class="our_services_one">
            <div class="container">
                <div class="block-title text-center">
                    <h4>atuação</h4>
                    <h2>Áreas de Atuação</h2>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4">
                        <div class="our_services_one_single wow fadeInUp">
                            <div class="our_services_one_image">
                                <img src="assets/images/service/service-1-img-1.jpg" alt="">
                            </div>
                            <div class="our_services_one_content">
                                <h3>Área de Atuação 1</h3>
                                <p>Aliq is notm hendr erit a augue insu image pellen simply freede text ipsum.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="our_services_one_single wow fadeInUp" data-wow-delay="100ms">
                            <div class="our_services_one_image">
                                <img src="assets/images/service/service-1-img-2.jpg" alt="">
                            </div>
                            <div class="our_services_one_content">
                                <h3>Área de Atuação 2</h3>
                                <p>Aliq is notm hendr erit a augue insu image pellen simply freede text ipsum.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="our_services_one_single wow fadeInUp" data-wow-delay="200ms">
                            <div class="our_services_one_image">
                                <img src="assets/images/service/service-1-img-3.jpg" alt="">
                            </div>
                            <div class="our_services_one_content">
                                <h3>Área de Atuação 3</h3>
                                <p>Aliq is notm hendr erit a augue insu image pellen simply freede text ipsum.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<!--Counter Three Start-->
<section class="counter_two three" style="background-image: url(assets/images/resources/counter_two_bg.jpg)">
            <div class="container">
                <ul class="counter_two_box list-unstyled">
                    <li class="counter_two_single wow fadeInLeft" data-wow-delay="100ms" data-wow-duration="1500ms">
                        <h2 class="counter">203</h2>
                        <p>Métrica 1</p>
                    </li>
                    <li class="counter_two_single wow fadeInLeft" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <h2 class="counter">480</h2>
                        <p>Métrica 2</p>
                    </li>
                    <li class="counter_two_single wow fadeInLeft" data-wow-delay="300ms" data-wow-duration="1500ms">
                        <h2 class="counter">260</h2>
                        <p>Métrica 3</p>
                    </li>
                    <li class="counter_two_single wow fadeInLeft" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <h2 class="counter">74</h2>
                        <p>Métrica 4</p>
                    </li>
                </ul>
            </div>
        </section>

        <!-- Projetos -->
        <section class="brand-one">
            <div class="container">
                <div class="brand-one__carousel owl-carousel thm__owl-carousel owl-theme"
                    data-options='{"loop": true, "autoplay": true, "autoplayHoverPause": true, "autoplayTimeout": 5000, "items": 5, "dots": false, "nav": false, "margin": 140, "smartSpeed": 700, "responsive": { "0": {"items": 2, "margin": 30}, "480": {"items": 3, "margin": 30}, "991": {"items": 4, "margin": 50}, "1199": {"items": 4, "margin": 100}}}'>
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                    <div class="item">
                        <img src="assets/images/brand/brand-1-1.png" alt="">
                    </div><!-- /.item -->
                </div>
            </div>
        </section>

        <!--Projects One Start-->
        <section class="our_projects_one">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="block-title text-left">
                            <h4>projetos</h4>
                            <h2>Veja alguns projetos</h2>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <ul class="project-filter style1 post-filter has-dynamic-filters-counter list-unstyled">
                            <li data-filter=".filter-item" class="active"><span class="filter-text">Todos</span></li>
                            <li data-filter=".inds"><span class="filter-text">Categoria 1</span></li>
                            <li data-filter=".fac"><span class="filter-text">Categoria 2</span></li>
                            <li data-filter=".elec"><span class="filter-text">Categoria 3</span></li>
                        </ul>
                    </div>
                </div>
                <div class="row filter-layout masonary-layout">
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds cons elec">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-1.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item elec cons">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-2.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item elec fac">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-3.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds cons">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-4.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item fac cons">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-5.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds elec">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-6.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds elec">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-1.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds elec">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-8.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 filter-item inds elec">
                        <!--Projects One Single-->
                        <div class="our_projects_one_single">
                            <div class="our_projects_one_image">
                                <img src="assets/images/project/project-page-img-2.jpg" alt="">
                                <div class="our_projects_one_icon">
                                    <a href="projeto.php"><span class="flaticon-plus"></span></a>
                                </div>
                                <div class="our_projects_one_text">
                                    <h4>Bridge <br> Construction</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="testimonails_two" style="background-image: url(assets/images/testimonials/testimonails_2-bg.jpg)">
            <div class="container">
                <div class="block-title text-center">
                    <h4>clientes</h4>
                    <h2>O que os clientes dizem?</h2>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 100, "slidesPerView": 4, "autoplay": { "delay": 5000 }, "breakpoints": {
                "0": {
                    "spaceBetween": 0,
                    "slidesPerView": 1
                },
                "425": {
                    "spaceBetween": 0,
                    "slidesPerView": 1
                },
                "575": {
                    "spaceBetween": 30,
                    "slidesPerView": 2
                },
                "767": {
                    "spaceBetween": 30,
                    "slidesPerView": 2
                },
                "991": {
                    "spaceBetween": 20,
                    "slidesPerView": 2
                },
                "1289": {
                    "spaceBetween": 20,
                    "slidesPerView": 2
                },
                "1440": {
                    "spaceBetween": 20,
                    "slidesPerView": 2
                }
            }}'>
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="testimonails_two_single">
                                        <div class="testimonails_two_quote_icon"><i class="fa fa-quote-left"></i></div>
                                        <div class="testimonails_two_text">
                                            <p>I was very impresed by the company service lore ipsum is simply free text
                                                used by copy typing refreshing. Neque porro est qui </p>
                                        </div>
                                        <div class="testimonails_two_client_name">
                                            <h3>Mike Hardson</h3>
                                            <p>CO Founder</p>
                                        </div>
                                        <div class="testimonails_two_image">
                                            <img src="assets/images/testimonials/testimonails_1-img-1.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="testimonails_two_single">
                                        <div class="testimonails_two_quote_icon"><i class="fa fa-quote-left"></i></div>
                                        <div class="testimonails_two_text">
                                            <p>I was very impresed by the company service lore ipsum is simply free text
                                                used by copy typing refreshing. Neque porro est qui </p>
                                        </div>
                                        <div class="testimonails_two_client_name">
                                            <h3>Jessica Brown</h3>
                                            <p>CO Founder</p>
                                        </div>
                                        <div class="testimonails_two_image">
                                            <img src="assets/images/testimonials/testimonails_1-img-2.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="testimonails_two_single">
                                        <div class="testimonails_two_quote_icon"><i class="fa fa-quote-left"></i></div>
                                        <div class="testimonails_two_text">
                                            <p>I was very impresed by the company service lore ipsum is simply free text
                                                used by copy typing refreshing. Neque porro est qui </p>
                                        </div>
                                        <div class="testimonails_two_client_name">
                                            <h3>Mike Hardson</h3>
                                            <p>CO Founder</p>
                                        </div>
                                        <div class="testimonails_two_image">
                                            <img src="assets/images/testimonials/testimonails_1-img-1.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="testimonails_two_single">
                                        <div class="testimonails_two_quote_icon"><i class="fa fa-quote-left"></i></div>
                                        <div class="testimonails_two_text">
                                            <p>I was very impresed by the company service lore ipsum is simply free text
                                                used by copy typing refreshing. Neque porro est qui </p>
                                        </div>
                                        <div class="testimonails_two_client_name">
                                            <h3>Jessica Brown</h3>
                                            <p>CO Founder</p>
                                        </div>
                                        <div class="testimonails_two_image">
                                            <img src="assets/images/testimonials/testimonails_1-img-2.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="welcome_one">
            <div class="welcome_one_shape_bg" style="background-image: url(assets/images/resources/welcome_one_shape-bg.png)"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="welcome_one_left">
                            <div class="welcome_one_left_image">
                                <img src="assets/images/resources/welcome-1-img-1.jpg" alt="">

                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="welcome_one_right_content">
                            <div class="block-title text-left">
                                <h4>Sobre</h4>
                                <h2>We’re More than a Industrial Company</h2>
                            </div>
                            <div class="welcome_one_right_text_box">
                                <p class="welcome_one_right_second_text">There are many variations of passages of Lorem
                                    Ipsum available, but the majority have suffered alteration in some form, by injected
                                    humour. Lorem are many variations of passages of Lorem
                                    Ipsum available, but the majority have suffered.</p>
                            </div>
                            <ul class="list-unstyled">
                                <li><i class="fa fa-check"></i>Invest in your simply neighborhood</li>
                                <li><i class="fa fa-check"></i>Support people in free text extreme need</li>
                                <li><i class="fa fa-check"></i>Largest global industrial business community</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="blog_one">
            <div class="container">
                <div class="block-title text-center">
                    <h4>blog</h4>
                    <h2>Notícias e Artigos</h2>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4">
                        <!--Blog One Single-->
                        <div class="blog_one_single wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms">
                            <div class="blog_one_image">
                                <img src="assets/images/blog/blog-1-img-1.jpg" alt="">
                                <div class="blog_one_date_box">
                                    <p>20 <br> Oct</p>
                                </div>
                            </div>
                            <div class="blog-one__content">
                                <ul class="list-unstyled blog-one__meta">
                                    <li><a href="post.php">por Eloiza Zanoni</a></li>
                                </ul>
                                <div class="blog_one_title">
                                    <h3><a href="post.php">We are best for any industrial business
                                            solutions</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <!--Blog One Single-->
                        <div class="blog_one_single wow fadeInDown" data-wow-duration="1500ms" data-wow-delay="100ms">
                            <div class="blog_one_image">
                                <img src="assets/images/blog/blog--page-img-4.jpg" alt="">
                                <div class="blog_one_date_box">
                                    <p>20 <br> Oct</p>
                                </div>
                            </div>
                            <div class="blog-one__content">
                                <ul class="list-unstyled blog-one__meta">
                                    <li><a href="post.php">por Eloiza Zanoni</a></li>
                                </ul>
                                <div class="blog_one_title">
                                    <h3><a href="post.php">Organically grow the holistic world view of
                                            disruptive</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <!--Blog One Single-->
                        <div class="blog_one_single wow fadeInRight" data-wow-duration="1500ms" data-wow-delay="200ms">
                            <div class="blog_one_image">
                                <img src="assets/images/blog/blog--page-img-6.jpg" alt="">
                                <div class="blog_one_date_box">
                                    <p>20 <br> Oct</p>
                                </div>
                            </div>
                            <div class="blog-one__content">
                                <ul class="list-unstyled blog-one__meta">
                                    <li><a href="post.php">por Eloiza Zanoni</a></li>
                                </ul>
                                <div class="blog_one_title">
                                    <h3><a href="post.php">Bring to the table win-win survival strategies
                                            to</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php /*FOOTER*/
        include('php/footer.php');
        ?>

    </div><!-- /.page-wrapper -->

    <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

    <div class="mobile-nav__wrapper">
        <div class="mobile-nav__overlay side-menu__toggler mobile-nav__toggler"></div>
        <!-- /.mobile-nav__overlay -->
        <div class="mobile-nav__content">
            <span class="mobile-nav__close side-menu__toggler mobile-nav__toggler"><i class="fa fa-times"></i></span>

            <div class="logo-box">
                <a href="index.php" aria-label="logo image"><img src="assets/images/resources/logo.png" width="101" alt="" /></a>
            </div>
            <!-- /.logo-box -->
            <div class="mobile-nav__container clearfix"></div>
            <!-- /.mobile-nav__container -->

            <ul class="mobile-nav__contact list-unstyled">
                <li>
                    <i class="flaticon-email"></i>
                    <a href="mailto:needhelp@azino.com">needhelp@inusti.com</a>
                </li>
                <li>
                    <i class="flaticon-telephone"></i>
                    <a href="tel:666-888-0000">666 888 0000</a>
                </li>
            </ul><!-- /.mobile-nav__contact -->
            <div class="mobile-nav__top">
                <div class="mobile-nav__language">
                    <img src="assets/images/resources/flag-1-1.jpg" alt="">
                    <label class="sr-only" for="language-select">select language</label>
                    <!-- /#language-select.sr-only -->
                    <select class="selectpicker" id="language-select">
                        <option value="english">English</option>
                        <option value="arabic">Arabic</option>
                    </select>
                </div><!-- /.mobile-nav__language -->
                <div class="mobile-nav__social">
                    <a href="#" aria-label="twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" aria-label="facebook"><i class="fab fa-facebook-square"></i></a>
                    <a href="#" aria-label="pinterest"><i class="fab fa-pinterest-p"></i></a>
                    <a href="#" aria-label="instagram"><i class="fab fa-instagram"></i></a>
                </div><!-- /.mobile-nav__social -->
            </div><!-- /.mobile-nav__top -->



        </div>
        <!-- /.mobile-nav__content -->
    </div>

    <div class="search-popup">
        <div class="search-popup__overlay custom-cursor__overlay">
            <div class="cursor"></div>
            <div class="cursor-follower"></div>
        </div><!-- /.search-popup__overlay -->
        <div class="search-popup__inner">
            <form action="#" class="search-popup__form">
                <input type="text" name="search" placeholder="Type here to Search....">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>

    <?php /*SCRIPTS*/
    include('php/scripts.php');
    ?>


</body>

</html>