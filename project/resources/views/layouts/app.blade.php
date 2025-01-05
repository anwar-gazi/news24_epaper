<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    @php $epaper_het = \App\Epaper::Getinformation(); @endphp
    <title><?php echo $epaper_het->epapper_name; ?></title>
    <meta name="Author" content="Doptor Design" />
    <meta name="Developed By" content="Doptor Design" />
    <meta name="Developer" content="Doptor Design" />

    <meta name="description" content="<?php echo $epaper_het->meta_description; ?>">
    <meta name="keywords" content="<?php echo $epaper_het->meta_tag; ?>">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="distribution" content="Global">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="bn" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta property="og:title" content="ePaper" />
    @if (!empty($home_page))
        <meta property="og:image"
            content="{{ asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image) }}" />
        <link rel="image_src"
            href="{{ asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image) }}" />
    @endif
    <meta property="og:image:type" content="image/jpeg" />
    <meta name="description"
        content="This is a responsible source of analytical news and views, delivered in both Print and Online version on an interactive, integrated media platform." />

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- icon -->
    <link rel="icon" type="image/png" href="{{ asset('assets/images/32x32.png') }}" />
    <!-- font awesome css -->
    {{-- <link rel="stylesheet" type="text/css" href="{{ asset('assets/font-awesome/css/font-awesome.min.css') }}" /> --}}
    <link rel="stylesheet" media="all" href="https://epaper.kalbela.com/css/font-awesome.min.css?v=2.0.016">
    <link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- main css -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/main.css?v=1.2') }}" />
    <!-- fonts -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/fonts/stylesheet.css') }}" />
    <!-- jquery js -->
    <script src="{{ asset('assets/js/jquery-3.1.1.min.js') }}"></script>
    <!-- maplight js -->
    <script src="{{ asset('assets/js/jquery.maphilight.min.js') }}"></script>
    <script type="text/javascript">
        $(function() {
            $('.map').maphilight();
        });
    </script>
    <!-- datepicker -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/jquery-ui/jquery-ui.css') }}">
    <script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.js') }}"></script>
    <script src="{{ asset('assets/js/moment-with-locales.min.js') }}"></script>
    <style type="text/css">
        .ui-datepicker-inline {
            width: auto !important;
            border-radius: 0px;
        }
    </style>

    <style type="text/css">
        @media (min-width: 0px) and (max-width: 768px) {
            .footerLogo {
                display: none !important;
            }
        }
    </style>

    @yield('css')

</head>

<body id="body">
    @php 
        $epaper_het = \App\Epaper::Getinformation(); 
        $logoSrc = asset('admin/assets/images/logo/') . '/' . $epaper_het->logo;
        $logoIconSrc = asset('admin/assets/images/ni.png');

        $publishDates = json_encode(DB::table('publish_dates')->where('status', 1)->pluck('publish_date'));
    @endphp
    <div class="main-container" style="margin-top: 10px;margin-bottom: 5px;">
        <div class="header-div">
            <header id="header_non-sticky" class="header-div non-sticky" style="box-shadow: 0 3px 5px #eee">
                <div class="container-fluid d-flex justify-content-between align-items-center py-2">
                    <a href="{{ url('/') }}" class="d-flex align-items-center">
                      <img id="main_logo" src="{{ $logoSrc }}" alt="Logo" style="max-width: 300px">
                    </a>
                  
                    <nav class="ms-auto d-none d-lg-flex">  <ul class="nav list-unstyled mb-0">
                        <li class="nav-item">
                          <a href="<?php echo $epaper_het->online; ?>" target="_blank" class="nav-link">
                            <img height="20" alt="Site symbol logo" class="me-2" src="{{ $logoIconSrc }}" style="vertical-align: sub"> অনলাইন
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" target="_blank" class="nav-link">
                            <i class="fa-sharp fa-solid fa-table-list"></i> আজকের পত্রিকা
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" target="_blank" class="nav-link">
                            <img width="16" src="https://kalbela.com/assets/verified_icon/archive.png" class="me-2" alt="archive"> আর্কাইভ
                          </a>
                        </li>
                        <li class="nav-item dropdown">
                          <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa-solid fa-thumbs-up me-2"></i> সোশ্যাল মিডিয়া
                          </a>
                          <ul class="dropdown-menu megamenu shadow"> <li>
                              <a href="<?php echo $epaper_het->facebook; ?>" target="_blank" class="d-flex align-items-center">
                                <i class="fa-brands fa-square-facebook" aria-hidden="true"></i>
                                <span class="ms-2">ফেসবুক</span>
                              </a>
                            </li>
                            <li>
                              <a href="<?php echo $epaper_het->youtube; ?>" target="_blank" class="d-flex align-items-center">
                                <i class="fa-brands fa-youtube" aria-hidden="true"></i>
                                <span class="ms-2">ইউটিউব</span>
                              </a>
                            </li>
                            <li>
                              <a href="{{ $epaper_het->twitter ? $epaper_het->twitter : "#" }}" target="_blank" class="d-flex align-items-center">
                                <i class="fa-brands fa-twitter" aria-hidden="true"></i>
                                <span class="ms-2">টুইটার</span>
                              </a>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </nav>
                  
                    <button class="btn btn-light d-lg-none hidden" type="button" data-bs-toggle="collapse" data-bs-target="#mobileNav" aria-controls="mobileNav" aria-expanded="false" aria-label="Toggle navigation">
                      <i class="fa-solid fa-bars"></i>
                    </button>
                  </div>
                  
                  <div class="collapse" id="mobileNav">
                    <nav class="nav flex-column px-3 py-2">
                      </nav>
                  </div>


                <!-- epaper_header_top_ad -->
                @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('epaper_header_top'); @endphp
                @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                    <div class="add text-center" style="margin: 20px;padding: 15px 10px 15px 10px">
                        <?php echo $epaper_header_top_ad->ad_code; ?>
                    </div>
                @endif
                <!-- end epaper_header_top_ad -->


                <div style="border-top: 1px solid #ccc;">
                    <div class="add text-center categories-nav container-fluid scrollmenu" style="padding: 20px 0; ">
                        <nav>
                            <ul>
                                <li><a href="{{ url('/') }}" aria-label="Latest News"><i class="fa-solid fa-house"></i></a></li>
                                @foreach($categories as $cat)
                                    <li><a href="{{ $cat['url'] }}" title="{{ $cat['label'] }}">{{ $cat['label'] }}</a></li>
                                @endforeach
                            </ul>
                        </nav>
                        @if (!empty($date))
                            @php $date_show = \App\Epaper::GetBanglaDate($date); @endphp
                            <input type="hidden" id="bangla_date" name="bangla_date" value="{{ isset($date_show) ? $date_show : '' }}">

                            <p class="hidden" style="margin-top: 10px">
                                @if (!empty($date))
                                    <a href="{{ url('/all/pages/nogor-edition/' . $date) }}"><img src="{{ asset('assets/images/front/all1.png') }}"></a>
                                @endif

                                @if (!empty($home_page) && !empty($date))
                                    @php
                                        $srcImage = asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image);
                                    @endphp
                                    <a href="javascript::void(0)" onclick='printPage("{{ $srcImage }}");' ><img src="{{ asset('assets/images/front/print.png') }}"></a>
                                    <canvas id="printable" style="display: none;" data-srcImage="{{ $srcImage }}"></canvas>
                                @endif
                            </p>
                        @endif
                    </div>
                </div>
            </header>

            <header id="header_sticky" class="sticky hidden d-lg-flex">
                <div class="container-fluid">
                    <div class="d-flex position-relative">
                        <div class="flex-fill py-2">
                            <a class="logo w-100" href="/">
                                <img class="img-fluid logo" src="{{ $logoIconSrc }}"> | <span id="today_date"></span></a>
                        </div>
                        <div class="flex-fill pt-2 sticky-categories-nav">
                            <nav>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>

            <main>
                @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('modal_top'); @endphp
                @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                    <div class="add text-center hidden d-lg-block"
                        style="margin-bottom: 20px;padding: 15px 10px 15px 10px">
                        <?php echo $epaper_header_top_ad->ad_code; ?>
                    </div>
                @endif

                @php
                    foreach ($get_categories as $key => $page) {
                        $page->url = url('/' . $page_edition . '/' . $date . '/' . $page->page_number);
                        $page->thumb = asset('uploads/epaper/' . date('Y', strtotime($page->publish_date)) . '/' . date('m', strtotime($page->publish_date)) . '/' . date('d', strtotime($page->publish_date)) . '/thumb/' . $page->image);
                    }
                @endphp

                <div class="row-div flex-container container-fluid" style="overflow: visible; overflow-x: auto">

                    <!-- left paper div -->
                    <div class="allPages_left">
                        @if (empty($page_name) && !empty($get_categories) && count($get_categories) > 0)
                            <div class="all-thumb current">সকল পাতা</div>
                            <div style="border: 1px solid #D2D0CE;width: 168px;height: 500px;overflow-y: scroll;">
                                <ul id="sideLeft_pagesUl" style="list-style: unset;padding: 0px;margin: 0px;">
                                    @foreach ($get_categories as $key => $page)
                                        <li style="padding: 10px">
                                            <a style="text-decoration: none;"
                                                href="{{ url('/' . $page_edition . '/' . $date . '/' . $page->page_number) }}"><img
                                                    src="{{ asset('uploads/epaper/' . date('Y', strtotime($page->publish_date)) . '/' . date('m', strtotime($page->publish_date)) . '/' . date('d', strtotime($page->publish_date)) . '/thumb/' . $page->image) }}"
                                                    style="width: 100%">
                                                <p
                                                    style="margin-bottom: 0px;padding: 3px;background-color: #ebe5de;text-align: center;color: black;border-bottom: 2px solid #939993">
                                                    {{ $page->name }}</p>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <!-- ad code -->
                        @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_3'); @endphp
                        @if (!empty($sidebar_ad_4) && !empty($sidebar_ad_4->ad_code) && $sidebar_ad_4->ad_status == '1')
                            <div class="hidden d-lg-block add text-center" style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                                <?php echo $sidebar_ad_4->ad_code; ?>
                            </div>
                        @endif
                        @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_4'); @endphp
                        @if (!empty($sidebar_ad_4) && !empty($sidebar_ad_4->ad_code) && $sidebar_ad_4->ad_status == '1')
                            <div class="hidden d-lg-block add text-center" style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                                <?php echo $sidebar_ad_4->ad_code; ?>
                            </div>
                        @endif

                    </div>

                    <!-- main paper div -->
                    <div id="content_div" class="relative">
                        <div id="content_topbar">
                            <a class="hidden" href="{{ url('/all/pages/nogor-edition/' . $date) }}"><img src="{{ asset('assets/images/front/all1.png') }}" style="position: absolute; left: 0"></a>
                            <div tabindex="0" class="datepicker_wrapper archive-cal-level text-center relative float-left" onclick="show('Datepicker1')">
                                <div class="inline"><i class="fa fa-calendar"></i> <span>{{ $date }}</span></div>
                                <div id="Datepicker1" class="absolute z-1 hidden" data-publishedDates="{{ $publishDates }}"></div>
                            </div>
                            <div class="pagination" style="margin: 0px;padding: 0px">
                                <a style="margin-left: 0px;" href="#">&laquo;</a>
                                @for ($i = 1; $i <= count($pagination_pages); $i++)
                                    <a class="{{ $i==$page_current? 'current' : '' }}" href="{{ url('/nogor-edition/' . $date . '/' . $i) }}">{{ $i }}</a>
                                @endfor
                                <a href="{{ url('/nogor-edition/' . $date . '/1') }}">&raquo;</a>
                            </div>
                            <div class="d-md-none">
                                @if (!empty($home_page))
                                    @php
                                        $srcImage = asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image);
                                    @endphp
                                    <button onclick='printPage("{{ $srcImage }}");' style="position: absolute; right: 0">
                                        <i class="fa fa-print"></i></button>
                                    <canvas id="printable" style="display: none;" data-srcImage="{{ $srcImage }}"></canvas>
                                @endif
                            </div>
                        </div>

                        <div>
                            @yield('content')
                        </div>

                        <div class="epaper-page-bar1 mt-4">
                            <a href="{{ url('/nogor-edition/' . $date . '/' . $page_prev) }}" class="e-previous e-previous-page e-but mr-3 e-previous-clse"><i class="fa fa-angle-left d-lg-block"></i></a>
                            <a href="{{ url('/nogor-edition/' . $date . '/' . $page_next) }}" class="e-next e-but"><i class="fa fa-angle-right d-lg-block"></i></a>
                        </div>
                    </div>



                    <!-- search result not found messages -->
                    @if (Session::has('message_not_found'))
                        <span id="message_not_found"></span>
                    @endif
                    <!-- end search result not found messages -->


                    <div id="img" class="fill-remaining d-md-none">
                        <div class="">
                            <div class="d-flex">
                                <div type="button" class="fill full-image-view all-thumb current">ইমেজ ভিউ</div>
                                <div id="news_img_download" type="button" class="fill all-thumb">ডাউনলোড</div>
                                <div id="close-popupMobile" type="button" class="fill all-thumb d-lg-none" onclick="closePreview()">বন্ধ করুন</div>
                            </div>

                            <div style="border: 1px solid #dee2e6!important; height: auto; background-color: white; padding: 10px; padding-bottom: 50px;">
                                <div id="img1" class=""
                                    style="display: flex; justify-content: center; align-items: center; margin-top: 50px; ">
                                    <canvas id="canvas_img1"></canvas>
                                </div>
                                <div id="img2"
                                    style="display: flex; justify-content: center; align-items: center; margin-top: 50px;">
                                    <canvas id="canvas_img2"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- right sidebar -->
                    <div class="row-div-right hidden" style="padding-right: 10px;margin-right: 0px;width: 200px; ">
                        <div class="right-content"
                            style="margin-top: 0px;background-color: white;border: none;padding: 0px !important;overflow: hidden;">

                            <!-- datepicker -->
                            <p
                                style="background-color: #EEEEEE;color: black;padding: 6px;text-align: center;width: auto;font-size: 18px;margin-bottom: 0px;border: 1px solid #c5c5c5;border-bottom: none;">
                                পুরোনো সংখ্যা</p>
                            <div id="Datepicker1_z"></div>

                            <!-- categories -->
                            @if (!empty($get_categories) && count($get_categories) > 0)
                                <div class="add text-center" style="margin-top: 10px">
                                    <p
                                        style="background-color: #EEEEEE;color: black;padding: 6px;text-align: center;width: auto;font-size: 18px;margin-bottom: 0px;border: 1px solid #c5c5c5;border-bottom: none;">
                                        আজকের পত্রিকা</p>
                                    <div style="border: 1px solid #c5c5c5;">
                                        <ul style="list-style: none;padding: 0px;margin: 0px;text-align: left;">
                                            @foreach ($get_categories as $key => $category)
                                                @if (!empty($category->category_id))
                                                    <li
                                                        style="border-bottom: 1px solid #c5c5c5;padding: 8px 10px 8px 10px">
                                                        <a style="font-size: 18px;color: black;text-decoration: none;"
                                                            href="{{ url('/nogor-edition/' . $category->publish_date . '/' . $category->page_number) }}">
                                                            &#8594; {{ $category->name }}</a>
                                                    </li>
                                                @endif
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            @endif

                            <!-- sidebar ad 4 -->
                            @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_1'); @endphp
                            @if (!empty($sidebar_ad_4) && !empty($sidebar_ad_4->ad_code) && $sidebar_ad_4->ad_status == '1')
                                <div class="add text-center"
                                    style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                                    <?php echo $sidebar_ad_4->ad_code; ?>
                                </div>
                            @endif
                            @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_2'); @endphp
                            @if (!empty($sidebar_ad_4) && !empty($sidebar_ad_4->ad_code) && $sidebar_ad_4->ad_status == '1')
                                <div class="add text-center"
                                    style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                                    <?php echo $sidebar_ad_4->ad_code; ?>
                                </div>
                            @endif
                            @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_3'); @endphp



                        </div>
                    </div>

                </div>

                <div id="contentBelow_pagesUl" class="container-fluid d-md-flex d-lg-none">
                    <ul class="ul_nav x-scrollable">
                        @foreach ($get_categories as $key => $page)
                            <li style="padding: 10px">
                                <a style="text-decoration: none;" href="{{ $page->url }}"><img src="{{ $page->thumb }}">
                                    <p style="margin-bottom: 0px;padding: 3px;background-color: #ebe5de;text-align: center;color: black;border-bottom: 2px solid #939993">
                                        {{ $page->name }}</p>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </main>

            <!-- epaper_header_bottom_ad -->
            @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('modal_bottom'); @endphp
            @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                <div class="hidden d-lg-block add text-center"
                    style="margin: 20px 0;padding: 15px 10px 15px 10px">
                    <?php echo $epaper_header_top_ad->ad_code; ?>
                </div>
            @endif
            @php $epaper_header_bottom_ad = \App\Epaper::GetAdvertisement('epaper_header_bottom'); @endphp
            @if (
                !empty($epaper_header_bottom_ad) &&
                    !empty($epaper_header_bottom_ad->ad_code) &&
                    $epaper_header_bottom_ad->ad_status == '1')
                <div class="hidden d-lg-block add text-center"
                    style="margin: 20px 0;padding: 15px 10px 15px 10px">
                    <?php echo $epaper_header_bottom_ad->ad_code; ?>
                </div>
            @endif
            <!-- end epaper_header_bottom_ad -->


            <div class="footer container-fluid" style="margin-top: 5px">
                <div class="footer-contend" style="padding: 3px; padding-bottom: 10px">

                    <div style="width: 100%;" class="footer_texts">
                        <table style="width: 100%">
                            <tr>
                                <td width="40%"><a href="{{ url('/') }}">
                                        <p class="footerLogo" style="padding-left: 10px">
                                            <img src="{{ asset('admin/assets/images/logo/') }}/<?php echo $epaper_het->logo; ?>"
                                                style="width: 250px">
                                        </p>
                                    </a>
                                </td>
                                <td width="10%">
                                    <div style="text-align: center !important;padding-left: 10px">

                                    </div>
                                </td>

                                <td width="50%">
                                    <div style="text-align: left !important;padding-left: 10px">
                                        <span style="white-space: pre-line"><?php echo $epaper_het->footer; ?></span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <p
                        style="font-size: 14px;color:black;border-top:1px solid #636363;margin-top: 1px;margin-bottom: 2px;padding-left: 0px">
                        <span style="white-space: pre-line; float: left"><?php echo $epaper_het->copyright; ?></span>

                        <span style="display: none; white-space: pre-line; float: right">সকল কারিগরী সহযোগিতায় <a
                                href="https://www.doptor-design.com.bd">Doptor ডিজাইন</a></span>
                    </p>

                </div>
            </div>
        </div>


        <!-- search result not found -->
        <script type="text/javascript">
            $(function() {
                $('<div class="alert-box message_body">আপনি যে বিষয়টি অনুসন্ধান করছেন তা খুজে পাওয়া যায়নি !! আপনাকে ধন্যবাদ খবর অনুসন্ধান করার জন্য ।</div>')
                    .insertBefore('#message_not_found')
                    .delay(3000)
                    .fadeOut(4000, function() {
                        $(this).remove();
                    });
            });
        </script>

        <!-- js for the page -->
        <script type="text/javascript">
            /*==Get the modal==*/
            var modal = document.getElementById('newsPopup');
            var body = document.getElementById('body');
            /*==Get the button that opens the modal==*/
            var btn = document.getElementById("myBtn");
            /*==Get the <span> element that closes the modal==*/
            var button = document.getElementsByClassName("close")[0];
            /*################################
            ## click on modal (x) close ##
            #################################*/
            button.onclick = function() {
                /*==remove related image class==*/
                var remove_image_item = document.getElementsByClassName("image_view")[0].innerHTML = "";
                $(".modal-body .image_view").attr("src", remove_image_item);
                var remove_related_item = document.getElementsByClassName("related_image")[0].innerHTML = "";
                $(".modal-body .related_image").attr("src", remove_related_item);

                modal.style.display = "none";
                document.getElementById("body").style.overflow = 'scroll';
            }


            /*##################################
            ## modal open ##
            ###################################*/

            function closeDiv() {
                const div = document.getElementById('img');
                if (div) {
                    div.style.display = 'none'; // Hide the div
                }
            }



            /*##################################
            ## click on next button ##
            ###################################*/
            $(".nxt").click(function() {
                $('.image_view').hide();
                $('.prvs').show();
                $('.nxt').hide();
                $('.related_image').show();

                var modal_width = $('.related_image').width();
                if (modal_width > 1050) {
                    modal_width = 1050;
                }
                if (modal_width < 750) {
                    modal_width = 750;
                }
                document.getElementById("modal-content").style.width = modal_width + 'px';
            });



            /*##################################
            ## click on previous ##
            ###################################*/
            $(".prvs").click(function() {
                $('.image_view').show();
                $('.prvs').hide();
                $('.nxt').show();
                $('.related_image').hide();

                var modal_width = $('.image_view').width();
                if (modal_width > 1050) {
                    modal_width = 1050;
                }
                if (modal_width < 750) {
                    modal_width = 750;
                }
                document.getElementById("modal-content").style.width = modal_width + 'px';
            });


            /*##################################
            ## click on close button ##
            ###################################*/
            $(".close").click(function() {
                $('.nxt').hide();
                $('.prvs').hide();
                $('.image_view').show();
            });
        </script>
        <!--end js for modal-->



        <!--pagination-->
        <script src="{{ asset('assets/js/jquery.paginate.js') }}" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                var total_pages = $('.get_pagination').val();
                var display_pages = total_pages;
                if (total_pages > 24) {
                    display_pages = 23;
                }
                $("#demo").paginate({
                    count: total_pages,
                    start: 1,
                    display: display_pages,
                    border: false,
                    text_color: '#888',
                    background_color: '#EEE',
                    text_hover_color: 'black',
                    background_hover_color: '#CFCFCF'
                });
            });

            function getPage(page) {
                var current_date = $('.current_date').val();
                var site_url = $('.site_url').val();
                $('.current_page').val(page);
                var request_url = site_url + '/nogor-edition/' + current_date + '/' + page;
                window.location = request_url;
            }
        </script>
        <!--pagination end-->



        <!-- article print-->
        <script type="text/javascript">
            function printDiv(bangla_date) {
                var newWin = window.open('', 'Print-Window');
                var site_url = $(".site_url").val();
                var main_image_link = $(".image_view").attr("src");
                var main_image = site_url + '/' + main_image_link;
                var related_image_link = $(".related_image").attr("src");
                var related_image = site_url + '/' + related_image_link;
                var footer_text = $(".footer").html();
                newWin.document.open();
                if (related_image_link != '') {
                    newWin.document.write('<html><body onload="window.print()">' +
                        '<center><img src="{{ asset('assets/images/logo1.png') }}" style="height:100px;" />' +
                        '<p style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;padding:5px;font-size:13px">' +
                        bangla_date + '</p>' + '<img src=' + main_image + ' />' + '</center></body>' + '<body><center>' +
                        '<img src=' + related_image +
                        ' /> <br> <p style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;padding:5px;font-size:13px">' +
                        footer_text + '</p>' + '</center></body>' + '</html>');
                } else {
                    newWin.document.write('<html><body onload="window.print()">' +
                        '<center><img src="{{ asset('assets/images/logo1.png') }}" style="height:100px;" />' +
                        '<p style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;padding:5px;font-size:13px">' +
                        bangla_date + '</p>' + '<img src=' + main_image +
                        ' /> <br> <p style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;padding:5px;font-size:13px">' +
                        footer_text + '</p>' + '</center></body></html>');
                }
                newWin.document.close();
                setTimeout(function() {
                    newWin.close();
                }, 10);
            }
        </script>


        <!-- share apis -->
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <script type="text/javascript">
            $('.share_on_fb').click(function() {
                var fb_link = '/' + $(".image_view").attr("src");
                var splitedfb = fb_link.split("images/");
                var lengthfb = splitedfb.length;
                var fb_link = splitedfb[lengthfb - 2];
                var mainImage = splitedfb[lengthfb - 1];

                var related_image = $(".related_image").attr("src");
                var site_url = $(".site_url").val();
                var current_date = $(".current_date").val();

                if (related_image != '') {
                    var splited = related_image.split("/");
                    var length = splited.length;
                    var related_image = splited[length - 1];
                    var requested_url = site_url + fb_link + 'images/shared/' + mainImage + '/' + related_image;
                    window.open('https://www.facebook.com/sharer/sharer.php?u=' + requested_url, '', 'window settings');
                } else {
                    var requested_url = site_url + fb_link + 'images/shared/' + mainImage;
                    window.open('https://www.facebook.com/sharer/sharer.php?u=' + requested_url, '', 'window settings');
                }
            });

            $('.share_on_whatsapp').click(function() {
                var fb_link = '/' + $(".main_image").attr("src");
                var splitedfb = fb_link.split("images/");
                var lengthfb = splitedfb.length;
                var fb_link = splitedfb[lengthfb - 2];
                var mainImage = splitedfb[lengthfb - 1];

                var related_image = $(".related_image").attr("src");
                var site_url = $(".site_url").val();
                var current_date = $(".current_date").val();
                if (related_image != '') {
                    var splited = related_image.split("/");
                    var length = splited.length;
                    var related_image = splited[length - 1];

                    var requested_url = site_url + fb_link + 'images/shared/' + mainImage + '/' + related_image;
                    window.open('https://api.whatsapp.com/send?text=' + requested_url, '', 'window settings');
                } else {
                    var requested_url = site_url + fb_link + 'images/shared/' + mainImage;
                    window.open('https://api.whatsapp.com/send?text=' + requested_url, '', 'window settings');
                }

            });

            $('.share_on_twt').click(function() {
                var tw_link = '/' + $(".image_view").attr("src");
                var tw_splited = tw_link.split("images/");
                var tw_length = tw_splited.length;
                var tw_link = tw_splited[tw_length - 2];
                var tw_mainImage = tw_splited[tw_length - 1];

                var tw_related_image = $(".related_image").attr("src");
                var site_url = $(".site_url").val();
                var current_date = $(".current_date").val();

                if (tw_related_image != '') {
                    var tw_related_splited = tw_related_image.split("/");
                    var tw_related_length = tw_related_splited.length;
                    var tw_related_image = tw_related_splited[tw_related_length - 1];
                    var tw_requested_url = site_url + tw_link + 'images/shared/' + tw_mainImage + '/' +
                        tw_related_image;
                    window.open('https://www.twitter.com/share?url=' + tw_requested_url, '', 'window settings');
                } else {
                    var tw_requested_url = site_url + tw_link + 'images/shared/' + tw_mainImage;
                    window.open('https://www.twitter.com/share?url=' + tw_requested_url, '', 'window settings');
                }

            });


            $('.share_on_gplus').click(function() {
                var gp_link = '/' + $(".image_view").attr("src");
                var gp_splited = gp_link.split("images/");
                var gp_length = gp_splited.length;
                var gp_link = gp_splited[gp_length - 2];
                var gp_mainImage = gp_splited[gp_length - 1];

                var gp_related_image = $(".related_image").attr("src");
                var site_url = $(".site_url").val();
                var current_date = $(".current_date").val();

                if (gp_related_image != '') {
                    var gp_related_splited = gp_related_image.split("/");
                    var gp_related_length = gp_related_splited.length;
                    var gp_related_image = gp_related_splited[gp_related_length - 1];
                    var gp_requested_url = site_url + gp_link + 'images/shared/' + gp_mainImage + '/' +
                        gp_related_image;
                    window.open('https://plus.google.com/share?url=' + gp_requested_url, '', 'window settings');
                } else {
                    var gp_requested_url = site_url + gp_link + 'images/shared/' + gp_mainImage;
                    window.open('https://plus.google.com/share?url=' + gp_requested_url, '', 'window settings');
                }

            });


            
        </script>

        <script type="text/javascript" src="{{ asset('assets/js/main.js') }}"></script>

        <input type="hidden" class="site_url" value="{{ url('/') }}">
        <input type="hidden" class="site_url_name" value="{{ \Request::route()->getName() }}">
        <input type="hidden" class="current_url" value="{{ Route::getCurrentRoute()->getPath() }}">

</body>

</html>
