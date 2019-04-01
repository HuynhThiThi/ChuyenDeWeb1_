<?php

namespace App\Models;

use App\Models\City;
use App\Models\FlightType;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    protected $table = 'flight';

    public static function getIndexData(){

        return [
            'city_list' => City::get(), //TODO: improve to eloquent
            'flight_type_list' => FlightType::get(), 
            'flight_class_list' => FlightClass::get(),
        ];
    }

    public static function search_flight_list($data){
        return Flight::where([
            ['from', $data['from']],
            ['to', $data['to']],
            ['departure', '>=', $data['departure']],
            ['departure', '<', $data['departure_nextday']],
            ['flight_type', $data['flight_type']],
            ['return', '>=', $data['return_date']],
            ['return', '<', $data['return_date_nextday']],
        ])->get();
    }
}
