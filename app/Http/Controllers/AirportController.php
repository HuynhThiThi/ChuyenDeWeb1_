<?php

namespace App\Http\Controllers;

use App\Models\Airport;
use App\Models\AirlineOrg;
use Illuminate\Http\Request;

class AirportController extends Controller
{
    public function airline_org_in_a_nation(){
        $airline_org_list = AirlineOrg::get_airline_org_in_a_nation(1);
        
        $this->data_view = [
            'airline_org_list'=>$airline_org_list
        ];
        // dd($airline_org_list);
        return view('airline_org_list',$this->data_view);

    }
}
