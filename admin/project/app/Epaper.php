<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Epaper extends Model
{


	######################
	## GetTables
	######################
	public static function GetTables($table_prefix){

		## find database tables ##
		$tables_name = \DB::select("SHOW TABLES LIKE "."'" .$table_prefix. "%'");

		foreach ($tables_name as $table) {
			foreach ($table as $key => $table_name){
				$td_name[] = $table_name;
			}
		}

		return $td_name;
	}

	public static function Get_(){

		$get_advertisement=\DB::table('info')->first();
		return $get_advertisement;
	}

    #-------------END------------#
}



