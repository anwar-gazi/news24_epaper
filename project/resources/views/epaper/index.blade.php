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
        /* color: white; */
        float: left;
        padding: 2px 7px;
        text-decoration: none;
        /* background-color: #846d6d; */
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

        <table class="hidden" style="width: 100%;margin: 0px 0px 10px 0px">
            <tr>
                <td>
                    <center class="relative">
                        <a class="hidden" href="{{ url('/all/pages/nogor-edition/' . $date) }}"><img src="{{ asset('assets/images/front/all1.png') }}" style="position: absolute; left: 0"></a>
                        <div tabindex="0" class="archive-cal-level text-center relative float-left" onclick="show('Datepicker1')" onfocusout="hide('Datepicker1')">
                            <div class="inline"><i class="fa fa-calendar"></i> <span>{{ $date }}</span></div>
                            <div id="Datepicker1" class="absolute z-1 hidden"></div>
                        </div>
                        <div class="pagination" style="margin: 0px;padding: 0px">
                            <a style="margin-left: 0px;" href="#">&laquo;</a>
                            @for ($i = 1; $i <= count($pagination_pages); $i++)
                                <a href="{{ url('/nogor-edition/' . $date . '/' . $i) }}">{{ $i }}</a>
                            @endfor
                            <a href="{{ url('/nogor-edition/' . $date . '/1') }}">&raquo;</a>
                        </div>
                        @if (!empty($home_page))
                            @php
                                $srcImage = asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image);
                            @endphp
                            <a href="javascript::void(0)" onclick='printPage("{{ $srcImage }}");' ><img src="{{ asset('assets/images/front/print.png') }}" style="position: absolute; right: 0"></a>
                            <canvas id="printable" style="display: none;" data-srcImage="{{ $srcImage }}"></canvas>
                        @endif
                    </center>
                </td>
            </tr>
        </table>
    @endif


    <div class="left-content">

        <div id="main-img-div" class="main-img-div" style="padding-left: 10px;padding-right: 10px;padding-bottom: 10px">
            @if (!empty($home_page) && !empty($date))
                <img src="{{ asset('uploads/epaper/' . date('Y', strtotime($home_page->publish_date)) . '/' . date('m', strtotime($home_page->publish_date)) . '/' . date('d', strtotime($home_page->publish_date)) . '/pages/' . $home_page->image) }}"
                    usemap="#enewspaper" class="map" />

                <map name="enewspaper">
                    @php
                        $image_location = 'uploads/epaper/' . date('Y', strtotime($date)) . '/' . date('m', strtotime($date)) . '/' . date('d', strtotime($date)) . '/images/';
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

        <table class="hidden" width="100%" class="page-trigger" style="padding: 10px 10px 0px 10px;margin-left: 0px">
            <tr>
                <td>
                    @if (!empty($date))
                        <a style="float: left" href="{{ url('/all/pages/nogor-edition/' . $date) }}" style="padding: 8px"><i class="fa fa-left"></i></a>
                    @endif
                </td>
                <td>
                    @if (!empty($get_categories) && count($get_categories) > 1 && !empty($date))
                        <a href="{{ url('/nogor-edition/' . $date . '/2') }}" class="pull-right"><i class="fa fa-right"></i></a>
                    @endif
                </td>
            </tr>
        </table>
        <br>

    </div>


    <input type="hidden" class="get_pagination" value="{{ isset($pagination_pages) ? count($pagination_pages) : '' }}">
    <input type="hidden" class="current_date" value="{{ isset($date) ? $date : '' }}">



   
    <!-- end share apis -->

@endsection
