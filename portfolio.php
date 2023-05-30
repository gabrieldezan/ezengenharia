<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Portfólio | EZ Engenharia</title>
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

    <div class="site-header__header-one-wrap clearfix">
            <div class="header_top_one">
                <div class="container">
                    <div class="header_top_one_inner clearfix">
                        <div class="header_top_one_inner_left float-left">
                            <div class="header_social_1">
                                <ul class="list-unstyled">
                                    <li><a href="#"><i class="fab fa-whatsapp"></i></a></li>
                                    <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="header_top_one_inner_right float-right">
                            <div class="header_topmenu_1">
                                <ul class="list-unstyled">
                                    <li><a href="mailto:contato@ezengenharia.com.br"><span class="flaticon-email"></span>contato@ezengenharia.com.br</a></li>
                                    <li><a href="tel:92-666-888-0000"><span class="flaticon-telephone"></span>(45) 9 9999-9999</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <header class="main-nav__header-one">
                <div class="container">
                    <nav class="header-navigation one stricky">
                        <div class="container-box clearfix">
                            <div class="main-nav__left main-nav__left_one float-left">
                                <div class="logo_one">
                                    <a href="index.php" class="main-nav__logo">
                                        <img src="assets/images/logo.png" class="main-logo"
                                            alt="Awesome Image">
                                    </a>
                                </div>
                                <a href="#" class="side-menu__toggler">
                                    <i class="fa fa-bars"></i>
                                </a>
                            </div>

                            <div class="main-nav__main-navigation one float-right">
                                <ul class=" main-nav__navigation-box float-left">
                                    <li>
                                        <a href="index.php">Home</a>
                                    </li>
                                    <li >
                                        <a href="sobre.php">Sobre</a>
                                    </li>
                                    <li class="dropdown current">
                                        <a href="portfolio.php">Portfólio</a>
                                        <ul>
                                            <li><a href="portfolio.php">Categoria 1</a></li>
                                            <li><a href="portfolio.php">Categoria 2</a></li>
                                            <li><a href="portfolio.php">Categoria 3</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="blog.php">Blog</a>
                                    </li>
                                    <li >
                                        <a href="contato.php">Contato</a>
                                    </li>
                                </ul>
                                <div class="main-nav__right main-nav__right_one float-left">
                                    <div class="header_btn_1">
                                        <a href="contato.php">Fazer Orçamento</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
        </div>

        <!-- <?php /*MENU*/
        include('php/menu.php');
        ?> -->

        <!--Page Header Start-->
        <section class="page-header" style="background-image: url(assets/images/backgrounds/page-header-contact.jpg);">
            <div class="container">
                <ul class="thm-breadcrumb list-unstyled">
                    <li><a href="index.php">Home</a></li>
                    <li><span>Portfólio</span></li>
                </ul>
                <h2>Portfólio</h2>
            </div>
        </section>

        <!--Projects One Start-->
        <section class="our_projects_one our_projects_page">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
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
                <a href="index.html" aria-label="logo image"><img src="assets/images/resources/logo.png" width="101" alt="" /></a>
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