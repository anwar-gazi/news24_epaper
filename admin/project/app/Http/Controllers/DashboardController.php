<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        ## get pages table ##
        $pages_tables = \App\Epaper::GetTables('pages');
        $count_pages_table = count($pages_tables);
        $pages_table=$pages_tables[$count_pages_table-1];


        foreach(glob('../uploads/temp/*', GLOB_ONLYDIR) as $key => $dir){

          $title = basename($dir);
          $directory='../uploads/temp/'.$title;

          $size = 0;
          foreach (new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($directory)) as $file) {
           $size += $file->getSize();
       }
       $size = ($size/1024)/1024;

       $data=array(
           'title' => $title,
           'size' => $size,
           );

       $folder_info[]=$data;

       $data['folder_info']=$folder_info;
   }    

   $total_pages=\DB::table($pages_table)->where($pages_table.'.publish_date',date('Y-m-d'))->where('status',1)->get();
   $data['total_pages']=count($total_pages);

   $total_users=\DB::table('users')->where('user_status',1)->where('id', '!=', 1)->get();
   $data['total_users']=count($total_users);

   $active_ads=\DB::table('advertisements')->where('ad_status',1)->get();
   $data['active_ads']=count($active_ads);

   $total_category=\DB::table('categories')->where('status',1)->get();
   $data['total_category']=count($total_category);

   return \View::make('dashboard.index',$data);
}
 public function nd()
      {
        $data['user_info']=\DB::table('info')->first();

        return \View::make('dashboard.details',$data);
      }

public function upnd()
    {

        date_default_timezone_set("Asia/Dhaka");
        $now = date('Y-m-d H:i:s');
 if(!empty(\Request::file('logo'))){
        $rules=array(
            'online' => 'Required',
            'facebook' => 'Required',
            'twitter' => 'Required',
            'youtube' => 'Required',
            'meta_description' => 'Required',
            'meta_tag' => 'Required',
            'epapper_name' => 'Required',
            'logo' => 'Required',
            'footer' => 'Required'
            );}else{
            $rules=array(
            'online' => 'Required',
            'meta_description' => 'Required',
            'meta_tag' => 'Required',
            'epapper_name' => 'Required',
            'facebook' => 'Required',
            'twitter' => 'Required',
            'youtube' => 'Required',
            'footer' => 'Required'
            );}$v = \Validator::make(\Request::all(), $rules);
           
           if($v->passes()){

            try{
                $id=\Auth::user()->role;
              if($id=='admin'){
                $name_implode="logo";

                if(!empty(\Request::file('logo'))){
                    $image = \Request::file('logo');
                    $img_ext=$image->getClientOriginalExtension();
                    $filename  = $name_implode.'-'.time().'.'.$img_ext;
                    $path ='assets/images/logo/' . $filename;
                   if (file_exists($path)) {
             return \Redirect::to('/details')->with('message',"Logo already exited");} 
          
                    \Image::make($image)->save($path);
                }else{
                    $filename='';
                }    
                
                if(!empty(\Request::file('logo'))){

                    $data=array(
                        'online' => \Request::input('online'),
                        'epapper_name' => \Request::input('epapper_name'),
                        'facebook' => \Request::input('facebook'),
                        'twitter' => \Request::input('twitter'),
                        'youtube' => \Request::input('youtube'),
                        'meta_description' => \Request::input('meta_description'),
                        'meta_tag' => \Request::input('meta_tag'),
                        'logo' => $filename,
                        'footer' => \Request::input('footer'),
                        'copyright' =>\Request::input('copyright'),
                        'updated_at' => $now,);}else{$data=array(
                        'online' => \Request::input('online'),
                        'epapper_name' => \Request::input('epapper_name'),
                        'facebook' => \Request::input('facebook'),
                        'twitter' => \Request::input('twitter'),
                        'youtube' => \Request::input('youtube'),
                        'meta_tag' => \Request::input('meta_tag'),
                        'meta_description' => \Request::input('meta_description'),
                        'footer' => \Request::input('footer'),
                        'copyright' =>\Request::input('copyright'),
                        'updated_at' => $now,
                        );
                }
                
                $update = \DB::table('info')->where('details',"details")->update($data);

                return \Redirect::to('/details')->with('message',"Information has been updated successfully !");

            }else{
                return \Redirect::to('/details')->withErrors("You have no permission");
            }
         
            }catch(\Exception $e){

                return \Redirect::to('/details')->with('message',"Problem updating Information.please try again..!");
            }

        }else return \Redirect::to('/details')->withInput()->withErrors($v->messages());

    }

    /**
     * Show the application removeTempFolder.
     *
     * @return \Illuminate\Http\Response
     */
    public function removeTempFolder($folder_title)
    {

    	$dir='../uploads/temp/'.$folder_title;

    	if ($dir) {

    		$files = new \RecursiveIteratorIterator(
    			new \RecursiveDirectoryIterator($dir, \RecursiveDirectoryIterator::SKIP_DOTS),
    			\RecursiveIteratorIterator::CHILD_FIRST
    			);

    		foreach ($files as $fileinfo) {
    			$todo = ($fileinfo->isDir() ? 'rmdir' : 'unlink');
    			$todo($fileinfo->getRealPath());
    		}

    		rmdir($dir);

    		return \Redirect::to('/home')->with('message',"Folder removed successfully !");

    	}else{

    		return \Redirect::to('/home')->with('message',"Folder could not found !");
    	}

    }


    /**
     * Show the application profile.
     *
     * @return \Illuminate\Http\Response
     */
    public function profile()
    {
        $data['user_info']=\DB::table('users')->where('email',\Auth::user()->email)->first();
        return \View::make('dashboard.profile',$data);
    }


    /**
     * Show the application profileUpdate.
     *
     * @return \Illuminate\Http\Response
     */
    public function profileUpdate()
    {

        date_default_timezone_set("Asia/Dhaka");
        $now = date('Y-m-d H:i:s');

        $rules=array(
            'name' => 'Required',
            'password' => 'min:6'
            );
        $v = \Validator::make(\Request::all(), $rules);

        if($v->passes()){

            try{
                $id=\Auth::user()->id;

                if(!empty(\Request::input('password'))){

                    $data=array(
                        'name' => \Request::input('name'),
                        'mobile' => \Request::input('mobile'),
                        'address' => \Request::input('address'),
                        'password' => \Hash::make(\Request::input('password')),
                        'updated_at' => $now,
                        );

                }else{
                    $data=array(
                        'name' => \Request::input('name'),
                        'mobile' => \Request::input('mobile'),
                        'address' => \Request::input('address'),
                        'updated_at' => $now,
                        );
                }


                $update = \DB::table('users')->where('id',$id)->update($data);

                return \Redirect::to('/profile')->with('message',"Profile has been updated successfully !");

            }catch(\Exception $e){

                return \Redirect::to('/profile')->with('message',"Problem updating profile.please try again..!");
            }

        }else return \Redirect::to('/profile')->withInput()->withErrors($v->messages());

    }



    #-------------------END-----------------#
}
