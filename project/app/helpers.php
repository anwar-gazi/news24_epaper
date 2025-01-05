<?php


function translateNumber($number, $locale = null)
{
    $locale = $locale ?: app()->getLocale(); // Use the current locale if not provided
    $digits = str_split((string) $number); // Split the number into individual digits
    
    return implode('', array_map(function ($digit) use ($locale) {
        return trans("number.$digit", [], $locale);
    }, $digits));
}
