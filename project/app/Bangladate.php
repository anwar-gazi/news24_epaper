<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bangladate extends Model
{
    private $timestamp;
    private $morning;
    private $engHour;
    private $engDate;
    private $engMonth;
    private $engYear;
    private $bangDate;
    private $bangMonth;
    private $bangYear;
    private $bn_months = ["পৌষ", "মাঘ", "ফাল্গুন", "চৈত্র", "বৈশাখ", "জ্যৈষ্ঠ", "আষাঢ়", "শ্রাবণ", "ভাদ্র", "আশ্বিন", "কার্তিক", "অগ্রহায়ণ"];
    private $bn_month_dates = [30, 30, 30, 30, 31, 31, 31, 31, 31, 30, 30, 30];
    private $bn_month_middate = [13, 12, 14, 13, 14, 14, 15, 15, 15, 15, 14, 14];
    private $lipyearindex = 3;

    public function __construct($timestamp, $hour = 6)
    {
        parent::__construct();
        $this->BanglaDate($timestamp, $hour);
    }

    public function BanglaDate($timestamp, $hour = 6)
    {
        $this->engDate = date('d', $timestamp);
        $this->engMonth = date('m', $timestamp);
        $this->engYear = date('Y', $timestamp);
        $this->morning = $hour;
        $this->engHour = date('G', $timestamp);

        // Calculate the Bangla date
        $this->calculate_date();
        
        // Set the Bangla year
        $this->calculate_year();
        
        // Convert English numbers to Bangla
        $this->convert();
    }

    public function set_time($timestamp, $hour = 6)
    {
        $this->BanglaDate($timestamp, $hour);
    }

    private function calculate_date()
    {
        $this->bangDate = $this->engDate - $this->bn_month_middate[$this->engMonth - 1];
        
        if ($this->engHour < $this->morning) {
            $this->bangDate -= 1;
        }

        if (($this->engDate <= $this->bn_month_middate[$this->engMonth - 1]) ||
            ($this->engDate == $this->bn_month_middate[$this->engMonth - 1] + 1 && $this->engHour < $this->morning)) {
            
            $this->bangDate += $this->bn_month_dates[$this->engMonth - 1];
            
            if ($this->is_leapyear() && $this->lipyearindex == $this->engMonth) {
                $this->bangDate += 1;
            }
            
            $this->bangMonth = $this->bn_months[$this->engMonth - 1];
        } else {
            $this->bangMonth = $this->bn_months[($this->engMonth) % 12];
        }
    }

    private function is_leapyear()
    {
        if ($this->engYear % 400 == 0 || ($this->engYear % 100 != 0 && $this->engYear % 4 == 0)) {
            return true;
        } else {
            return false;
        }
    }

    private function calculate_year()
    {
        $this->bangYear = $this->engYear - 593;
        
        if (($this->engMonth < 4) || (($this->engMonth == 4) && (($this->engDate < 14) || ($this->engDate == 14 && $this->engHour < $this->morning)))) {
            $this->bangYear -= 1;
        }
    }

    private function bangla_number($int)
    {
        $engNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
        $bangNumber = ['১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯', '০'];
        $converted = str_replace($engNumber, $bangNumber, $int);
        return $converted;
    }

    private function convert()
    {
        $this->bangDate = $this->bangla_number($this->bangDate);
        $this->bangYear = $this->bangla_number($this->bangYear);
    }

    public function get_date()
    {
        return [$this->bangDate, $this->bangMonth, $this->bangYear];
    }

    public static function BDdate($time)
    {
        $bn = new self($time);
        $output = $bn->get_date();
        $ReadyDate = "$output[0] $output[1] $output[2]";
        return $ReadyDate;
    }
}

