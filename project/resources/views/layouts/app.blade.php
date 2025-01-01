<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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


    <!-- icon -->
    <link rel="icon" type="image/png" href="{{ asset('assets/images/32x32.png') }}" />
    <!-- font awesome css -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/font-awesome/css/font-awesome.min.css') }}" />
    <!-- main css -->
    <link rel="stylesheet" href="{{ asset('assets/css/main.css?v=1.2') }}" />
    <!-- fonts -->
    <link rel="stylesheet" href="{{ asset('assets/fonts/styles.css') }}" />
    <!-- jquery js -->
    <script src="{{ asset('assets/js/jquery-3.1.1.min.js') }}"></script>
    <!-- maplight js -->
    <script src="{{ asset('assets/js/jquery.maphilight.min.js') }}"></script>
    <script type="text/javascript">
        $(function() {
            $('.map').maphilight();
        });
    </script>
    <!-- main js -->
    <script type="text/javascript" src="{{ asset('assets/js/main.js') }}"></script>
    <!-- datepicker -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/jquery-ui/jquery-ui.css') }}">
    <script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.js') }}"></script>
    <style type="text/css">
        .ui-datepicker-inline {
            width: auto !important;
            border-radius: 0px;
        }
    </style>

    <style type="text/css">
        @media (min-width: 0px) and (max-width: 400px) {
            .footerLogo {
                display: none !important;
            }
        }
    </style>

    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body id="body">

    <div class="main-container" style="margin-top: 5px;margin-bottom: 5px;border: 3px solid #e2dbdb;width: 1150px">
        <div class="header-div">
            <div class="header-div">

                <!-- header top -->
                <div class="top-header"
                    style="height: 33px;padding: 5px 10px;background-color: #EEEEEE;box-shadow: none;border-bottom: none;">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td>
                                <div class="date text-left" style="margin-top: 2px">
                                    @php $epaper_het = \App\Epaper::Getinformation(); @endphp
                                    <p style="color: black;font-size: 17px">
                                        অনলাইন ভার্সন দেখতে ক্লিক করুন <a href="<?php echo $epaper_het->online; ?>">অনলাইন ভার্সন</a>
                                    </p>
                                </div>
                            </td>
                            <td>
                                <div class="social-icon" style="text-align: right;margin-top: 3px">
                                    <ul class="list-unstyled" style="height: 32px;margin-left: 0;padding-left: 0">
                                        <li class="fb btn"><a href="<?php echo $epaper_het->facebook; ?>" target="_blank"><i
                                                    class="fa fa-facebook" aria-hidden="true"></i></a>
                                        </li>
                                        <li class="twit btn"><a href="<?php echo $epaper_het->twitter; ?>" target="_blank"><i
                                                    class="fa fa-twitter" aria-hidden="true"></i></a>
                                        </li>
                                        <li class="gplus btn"><a href="<?php echo $epaper_het->youtube; ?>" target="_blank"><i
                                                    class="fa fa-youtube-play" aria-hidden="true"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- header top end -->


                <!-- epaper_header_top_ad -->
                @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('epaper_header_top'); @endphp
                @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                    <div class="add text-center"
                        style="background-color: #EEEEEE;margin: 20px;padding: 15px 10px 15px 10px">
                        <?php echo $epaper_header_top_ad->ad_code; ?>
                    </div>
                @endif
                <!-- end epaper_header_top_ad -->


                <div class="add text-center" style="background-color: #EEEEEE;margin: 10px;padding: 2px 2px 2px 2px">
                    <a href="{{ url('/') }}"><img
                            src="{{ asset('admin/assets/images/logo/') }}/<?php echo $epaper_het->logo; ?>"
                            style="width: 300px"></a>

                    @if (!empty($date))
                        <p>
                            @php$date_show = \App\Epaper::GetBanglaDate($date);

                            @endphp
                        <p style="font-size: 18px;margin-bottom: 0px;line-height: 21px;color: #BB1919;padding-top: 3px">
                            {{ isset($date_show) ? $date_show : '' }}</p>
                        <input type="hidden" id="bangla_date" name="bangla_date"
                            value="{{ isset($date_show) ? $date_show : '' }}"></p>

                        <p style="margin-top: 10px">
                            @if (!empty($date))
                                <a href="{{ url('/all/pages/nogor-edition/' . $date) }}"><img
                                        src="{{ asset('assets/images/front/all1.png') }}"></a>
                            @endif
                            @if (!empty($home_page) && !empty($date))
                                <a href="javascript::void(0)"
                                    onclick='printPage("{{ asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image) }}");'><img
                                        src="{{ asset('assets/images/front/print.png') }}"></a>
                            @endif
                        </p>
                    @endif
                </div>
            </div>

            @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('modal_top'); @endphp
            @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                <div class="add text-center"
                    style="background-color: #EEEEEE;margin: 20px;padding: 15px 10px 15px 10px">
                    <?php echo $epaper_header_top_ad->ad_code; ?>
                </div>
            @endif

            <div class="row-div" style="overflow: hidden;">



                <!-- left paper div -->
                <div class="row-div-left" style="padding-left: 10px;width: 170px;margin-left: 0px;">
                    @if (empty($page_name) && !empty($get_categories) && count($get_categories) > 0)
                        <p
                            style="text-align: center;background-color: #eeeeee;padding: 4px;border: 1px solid #D2D0CE;border-bottom: none;">
                            <img src="{{ asset('assets/images/front/all1.png') }}"></p>
                        <div style="border: 1px solid #D2D0CE;width: 168px;height: 500px;overflow-y: scroll;">
                            <ul style="list-style: unset;padding: 0px;margin: 0px;">
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
                        <div class="add text-center" style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                            <?php echo $sidebar_ad_4->ad_code; ?>
                        </div>
                    @endif
                    @php $sidebar_ad_4 = \App\Epaper::GetAdvertisement('sidebar_ad_4'); @endphp
                    @if (!empty($sidebar_ad_4) && !empty($sidebar_ad_4->ad_code) && $sidebar_ad_4->ad_status == '1')
                        <div class="add text-center" style="margin-top: 10px;padding: 5px;border: 1px solid #c5c5c5">
                            <?php echo $sidebar_ad_4->ad_code; ?>
                        </div>
                    @endif

                </div>



                <!-- main paper div -->
                <div id="content_div" class="row-div-left" style="padding-left: 10px;width: auto;margin-left: 10px;">
                    <div>
                        @yield('content')
                    </div>
                </div>

                <!-- search result not found messages -->
                @if (Session::has('message_not_found'))
                    <span id="message_not_found"></span>
                @endif
                <!-- end search result not found messages -->


                <div id="img"
                    style="position: absolute; border: 1px solid #dee2e6!important; width: 400px; height: auto; z-index: 100; background-color: white; display: none; padding: 10px; padding-bottom: 50px;">

                    <span class="close-button" onclick="closeDiv()"
                        style="position: absolute; top: 5px; left: 5px; cursor:pointer; font-size: 16px; padding: 2px 5px; border: 1px solid gray; border-radius: 3px; background-color: white;">X</span>

                    <div id="img1"
                        style="display: flex; justify-content: center; align-items: center; margin-top: 50px; ">
                        <img class="img1" src="" />
                    </div>
                    <div id="img2"
                        style="display: flex; justify-content: center; align-items: center; margin-top: 50px;">
                        <img class="img2" src="" />
                    </div>
                </div>

                <!-- right sidebar -->
                <div class="row-div-right" style="padding-right: 10px;margin-right: 0px;width: 200px">
                    <div class="right-content"
                        style="margin-top: 0px;background-color: white;border: none;padding: 0px !important;overflow: hidden;">

                        <!-- datepicker -->
                        <p
                            style="background-color: #EEEEEE;color: black;padding: 6px;text-align: center;width: auto;font-size: 18px;margin-bottom: 0px;border: 1px solid #c5c5c5;border-bottom: none;">
                            পুরোনো সংখ্যা</p>
                        <div id="Datepicker1"></div>

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
                                                        &#8594; {{ $category->name }}</a></li>
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

            <!-- epaper_header_bottom_ad -->
            @php $epaper_header_top_ad = \App\Epaper::GetAdvertisement('modal_bottom'); @endphp
            @if (!empty($epaper_header_top_ad) && !empty($epaper_header_top_ad->ad_code) && $epaper_header_top_ad->ad_status == '1')
                <div class="add text-center"
                    style="background-color: #EEEEEE;margin: 20px;padding: 15px 10px 15px 10px">
                    <?php echo $epaper_header_top_ad->ad_code; ?>
                </div>
            @endif
            @php $epaper_header_bottom_ad = \App\Epaper::GetAdvertisement('epaper_header_bottom'); @endphp
            @if (
                !empty($epaper_header_bottom_ad) &&
                    !empty($epaper_header_bottom_ad->ad_code) &&
                    $epaper_header_bottom_ad->ad_status == '1')
                <div class="add text-center"
                    style="background-color: #EEEEEE;margin: 20px;padding: 15px 10px 15px 10px">
                    <?php echo $epaper_header_bottom_ad->ad_code; ?>
                </div>
            @endif
            <!-- end epaper_header_bottom_ad -->


            <div class="footer" style="margin-top: 5px">
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


        @php $publishDates = DB::table('publish_dates')->where('status', 1)->pluck('publish_date'); @endphp

        <!-- datepicker -->
        <script type="text/javascript">
            jQuery(function() {
                var enableDays = <?php echo json_encode($publishDates); ?>;

                function enableAllTheseDays(date) {
                    var sdate = $.datepicker.formatDate('yy-mm-dd', date)
                    if ($.inArray(sdate, enableDays) != -1) {
                        return [true];
                    }
                    return [false];
                }
                $('#Datepicker1').datepicker({
                    dateFormat: 'yy-mm-dd',
                    beforeShowDay: enableAllTheseDays
                });
            })


            $(function() {
                $("#Datepicker1").datepicker();
                $("#Datepicker1").on("change", function() {
                    var archive_date = $(this).val();
                    var site_url = $(".site_url").val();
                    if (archive_date == '') {
                        alert('Please Select A Valid Date !');
                        window.reload();
                    }
                    if (archive_date != null) {
                        var request_url = site_url + '/nogor-edition/' + archive_date + '/1';
                        window.location = request_url;
                    }
                });
            });
        </script>


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

        <input type="hidden" class="site_url" value="{{ url('/') }}">
        <input type="hidden" class="site_url_name" value="{{ \Request::route()->getName() }}">
        <input type="hidden" class="current_url" value="{{ Route::getCurrentRoute()->getPath() }}">

</body>

</html>
