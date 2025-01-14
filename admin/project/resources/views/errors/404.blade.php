
@extends('layouts.app')
@push('page-css')

<title>Be right back.</title>

<style>
    html, body {
        height: 100%;
    }

    body {
        margin: 0;
        padding: 0;
        width: 100%;
        color: #B0BEC5;
        display: table;
        font-weight: 100;
    }

    .container {
        text-align: center;
        display: table-cell;
        vertical-align: middle;
    }

    .content {
        text-align: center;
        display: inline-block;
    }

    .title {
        font-size: 72px;
        margin-bottom: 40px;
    }
</style>

@endpush
@section('content')

<div class="container">
    <div class="content">
        <div class="title">404..Be right back.</div>
    </div>
</div>

@endsection