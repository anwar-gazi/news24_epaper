@extends('layouts.app')

@section('css')
<style type="text/css">
    li.current_edition:hover {
        background-color: inherit !important
    }
</style>

<style type="text/css">
    #mask {
        position: absolute;
        left: 0;
        top: 0;
        z-index: 9000;
        background-color: #000;
        display: none;
    }

    #boxes .window {
        position: absolute;
        left: 0;
        top: 20px;
        width: auto;
        height: auto;
        display: none;
        z-index: 9999;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
    }

    #boxes #dialog {
        width: auto;
        height: auto;
        padding: 10px;
    }
</style>


<!-- pagination -->
<style type="text/css">
    .pagination {
        display: inline-block;
        margin-top: 15px;
    }

    .pagination a {
        color: white;
        float: left;
        padding: 2px 7px;
        text-decoration: none;
        background-color: #846d6d;
        border: 1px solid #ddd;
        margin: 0 4px;
    }

    .pagination a.active {
        background-color: #CC0000;
        color: white;
        border: 1px solid #CC0000;
    }

    .pagination a:hover:not(.active) {
        background-color: #ddd;
    }
</style>

<style type="text/css">
    .modal {
        background-image: url({{ asset('assets/images/overlay.png') }});
    }
</style>

@endsection('css')

@section('content')

    @if (!empty($date))
        @php $date_show=\App\Epaper::GetBanglaDate($date); @endphp

        <table style="width: 100%;background-color: #d2d0ce;margin: 0px 0px 10px 0px">
            <tr>
                <td>
                    <center>
                        <div class="pagination" style="margin: 0px;padding: 5px">
                            <a style="margin-left: 0px;" href="#">&laquo;</a>
                            @for ($i = 1; $i <= count($pagination_pages); $i++)
                                <a href="{{ url('/nogor-edition/' . $date . '/' . $i) }}">{{ $i }}</a>
                            @endfor
                            <a href="{{ url('/nogor-edition/' . $date . '/1') }}">&raquo;</a>
                        </div>
                    </center>
                </td>
            </tr>
        </table>
    @endif


    <div class="left-content">

        <div class="main-img-div" style="padding-left: 10px;padding-right: 10px;padding-bottom: 10px">
            @if (!empty($home_page) && !empty($date))
                <img src="{{ asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image) }}"
                    usemap="#enewspaper" class="map" />

                <map name="enewspaper">
                    @php
                        $image_location =
                            'uploads/epaper/' .
                            date('Y', strtotime($date)) .
                            '/' .
                            date('m', strtotime($date)) .
                            '/' .
                            date('d', strtotime($date)) .
                            '/images/';
                    @endphp

                    @if (!empty($epaper_articles) && count($epaper_articles) > 0)
                        @foreach ($epaper_articles as $key => $article)
                            @php
                                $related_item = \App\Epaper::GetRelatedItem($date, $article->related_image_id);
                                $get_image_width = \App\Epaper::GetImageSize($image_location . $article->image);
                            @endphp

                            <area shape="rect" coords="{{ $article->coords }}" data-image="{{ $article->image }}"
                                class="main-img"
                                onclick="modalOpen('<?php echo $article->image; ?>','<?php echo $image_location; ?>','<?php echo $related_item; ?>','<?php echo $get_image_width; ?>')" />
                        @endforeach
                    @endif
                </map>
            @else
                <img src="{{ asset('assets/images/underConstruction.png') }}">
            @endif
        </div>

        <table width="100%" class="page-trigger" style="padding: 10px 10px 0px 10px;margin-left: 0px">
            <tr>
                <td>
                    @if (!empty($date))
                        <a style="float: left" href="{{ url('/all/pages/nogor-edition/' . $date) }}"
                            style="padding: 8px"><img src="{{ asset('assets/images/front/all.png') }}" /></a>
                    @endif
                </td>
                <td>
                    @if (!empty($get_categories) && count($get_categories) > 1 && !empty($date))
                        <a href="{{ url('/nogor-edition/' . $date . '/2') }}" class="pull-right"><img
                                src="{{ asset('assets/images/front/next.png') }}" /></a>
                    @endif
                </td>
            </tr>
        </table>
        <br>

    </div>



    <!-- The Modal -->
    <div id="newsPopup" class="modal hidden">
        <div class="modal-content customized_content loading_img" id="modal-content">
            <div class="modal-head">
                <table width="100%" class="modal_table">
                    <tr>
                        <td style="width: 40px">
                        </td>
                        <td class="text-center">
                            <p>
                                <a href="{{ url('/') }}"><img
                                        src="{{ asset('admin/assets/images/logo/') }}/<?php echo $info->logo; ?>"
                                        style="height: 50px;padding: 5px 0px"></a>
                            </p>
                        </td>

                        <td style="width: 40px" valign="top">
                            <p>
                                <button class="btn btn-danger close"
                                    style="padding: 8px 10px 8px 10px;margin-top: 2px;font-size: 16px;border-radius: 50%;"
                                    title="close"><i class="fa fa-times"></i></button>
                            </p>
                        </td>
                    </tr>
                </table>


            </div>

            <div class="modal-body text-center" style="padding: 20px;">
                <div class="modal-main-img" id="newsImg" style="overflow-x: auto;">

                    <center>
                        <img src="" class="image_view" style="border: 2px solid #CCC;" />
                        <img src="" class="related_image" style="border: 2px solid #CCC;display: none" />
                    </center>

                </div>

                <div style="margin-top: 20px;margin-right:auto;padding-bottom: 20px">

                    <div style="float: left;">
                        <span style="font-size: 20px;border-bottom: 2px solid black;">শেয়ার করুন</span>
                        <button type="button" style="background-color: #3C5A98;border-radius: 50%;padding: 5px 9px 5px 9px"
                            class="btn btn-default share_on_fb"><i class="fa fa-facebook" style="color: white"
                                aria-hidden="true"></i></button>

                        <button type="button" style="background-color: #25D366;border-radius: 50%;padding: 5px 9px 5px 9px"
                            class="btn btn-default share_on_whatsapp"><i class="fa fa-whatsapp" style="color: white"
                                aria-hidden="true"></i></button>

                        <button type="button"
                            style="background-color: #1DA1F2;border-radius: 50%;padding: 5px 7px 5px 7px;"
                            class="btn btn-default share_on_twt"><i class="fa fa-twitter" style="color: white"
                                aria-hidden="true"></i></button>

                        <button type="button" class="btn btn-default share_on_gplus"
                            style="background-color: #E53935;border-radius: 50%;padding: 5px 7px 5px 7px;"><i
                                class="fa fa-google" style="color: white" aria-hidden="true"></i></button>

                        <button style="border-radius: 50%;padding: 5px 7px 5px 7px;" type="button"
                            onclick='printDiv("<?php echo $date_show; ?>");' name="b_print" class="btn btn-success"> <i
                                class="fa fa-print"></i></button>

                    </div>

                    <div style="float: right">
                        <button class="btn btn-info trigger-prev prvs" style="display: none;padding: 2px 6px"><i
                                class="fa fa-backward" aria-hidden="true"></i>&nbsp;&nbsp;পূর্ববর্তী অংশ</button>
                        <button class="btn btn-info trigger-next nxt" style="display: none;padding: 2px 6px">পরবর্তী
                            অংশ&nbsp;&nbsp;<i class="fa fa-forward" aria-hidden="true"></i></button>
                    </div>
                </div>
                <br />
            </div>

            <div class="modal-footer">
                <div style="width: 100%;" class="footer_texts">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="footer" style="text-align: center !important;padding-left: 10px">
                                    <span style="white-space: pre-line"><?php echo $info->footer; ?></span>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <!--modal end-->


    <input type="hidden" class="get_pagination" value="{{ isset($pagination_pages) ? count($pagination_pages) : '' }}">
    <input type="hidden" class="current_date" value="{{ isset($date) ? $date : '' }}">



   
    <!-- end share apis -->

@endsection
