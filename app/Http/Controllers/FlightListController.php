<?php

namespace App\Http\Controllers;

use App\Models\Flight;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FlightListController extends Controller
{

    public function flight_list(Request $request)
    {
        // dd($request->all());
        $data = $request->all();
        $departure = new \DateTime($request->departure_date);

        $departure_nextday = new \DateTime($request->departure_date . ' + 1 days');

        $return_date = new \DateTime($request->return_date);
        $return_date_nextday = new \DateTime($request->return_date . ' + 1 days');
        $data['departure'] = $departure;
        $data['departure_nextday'] = $departure_nextday;
        $data['return_date'] = $return_date;
        $data['return_date_nextday'] = $return_date_nextday;
//        dd($departure->format('Y-m-d h:i:s'));
        $flight_list = Flight::search_flight_list($data);
        

        $city_list = DB::table('city')->get();
        $this->data_view = [
            'flight_list'=>$flight_list,
            'city_list'=>$city_list
        ];
        // dd($flight_list);
        return view('flight-list', $this->data_view);
    }
}
