<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //nation
        DB::table('nation')->insert([
            'name' => 'Việt Nam',
            'code' => 'VN',
        ]);
        DB::table('nation')->insert([
            'name' => 'Korean',
            'code' => 'KR',
        ]);
        DB::table('nation')->insert([
            'name' => 'Qatar',
            'code' => 'QT',
        ]);
        

//flight_class
        DB::table('flight_class')->insert([
            'name' => 'Bussiness',
        ]);
        DB::table('flight_class')->insert([
            'name' => 'Economy',
        ]);
        DB::table('flight_class')->insert([
            'name' => 'Economy Premium',
        ]);

//flight_type
        DB::table('flight_type')->insert([
            'name' => 'One way',
        ]);
        DB::table('flight_type')->insert([
            'name' => 'Return',
        ]);


        // city
        DB::table('city')->insert([
            'name' => 'Sài Gòn',
            'code' => 'SGN',
            'nation_id' => '1',
        ]);
        DB::table('city')->insert([
            'name' => 'Hà Nội',
            'code' => 'HN',
            'nation_id' => '1',
        ]);
        DB::table('city')->insert([
            'name' => 'Đã Nẵng',
            'code' => 'DNG',
            'nation_id' => '1',
        ]);

        DB::table('airline_org')->insert([
            'name' => 'VietNam Airlines',
            'code' => 'VNAL',
            'nation_id' => '1',
        ]);
        DB::table('airline_org')->insert([
            'name' => 'Vietject',
            'code' => 'QAL',
            'nation_id' => '1',
        ]);
        DB::table('airline_org')->insert([
            'name' => 'Jetstars',
            'code' => 'KAL',
            'nation_id' => '1',
        ]);
        //airport
        DB::table('airport')->insert([
            'name' => 'Tân Sơn Nhất',
            'code' => 'TSN',
            'city_id' => '1',
        ]);
        DB::table('airport')->insert([
            'name' => 'Nội Bài',
            'code' => 'NBA',
            'city_id' => '2',
        ]);
        DB::table('airport')->insert([
            'name' => 'Da Nang airport',
            'code' => 'DNA',
            'city_id' => '3',
        ]);

//            org_id    from    to    duration    transit
        DB::table('flight')->insert([
            'org_id' => 1,
            'from' => 1,
            'to' => 2,
            'flight_type' => 2,
            'economy_seat_num' => 30,
            'economy_premium_seat_num' => 20,
            'bussiness_seat_num' => 10,
            'departure' => '2019-01-01 04:30',
            'return' => '2019-01-02 07:30',
            'duration' => 8,
            'transit' => 5,
        ]);
        DB::table('flight')->insert([
            'org_id' => 2,
            'from' => 2,
            'to' => 3,
            'flight_type' => 1,
            'economy_seat_num' => 30,
            'economy_premium_seat_num' => 20,
            'bussiness_seat_num' => 10,
            'departure' => '2019-01-01 01:30',
            'return' => '2019-01-02 08:30',
            'duration' => 2,
            'transit' => 4,
        ]);
        DB::table('flight')->insert([
            'org_id' => 3,
            'from' => 1,
            'to' => 2,
            'flight_type' => 1,
            'economy_seat_num' => 30,
            'economy_premium_seat_num' => 20,
            'bussiness_seat_num' => 10,
            'departure' => '2019-01-01 09:30',
            'return' => '2019-01-02 01:30',
            'duration' => 44,
            'transit' => 11,
        ]);

// // user
        //     id    name    email    phone    password    remember_token    created_at    updated_at
        DB::table('users')->insert([
            'name' => 'Khach hang 1',
            'email' => 'kh1@gmail.com',
            'phone' => 'kh1@gmail.com',
            'password' => bcrypt('kh1@gmail.com'),
            'remember_token' => '',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        DB::table('users')->insert([
            'name' => 'Khach hang 2',
            'email' => 'kh2@gmail.com',
            'phone' => 'kh2@gmail.com',
            'password' => bcrypt('kh2@gmail.com'),
            'remember_token' => '',
            'created_at' => date('Y-m-d h:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        DB::table('users')->insert([
            'name' => 'Khach hang 3',
            'email' => 'kh3@gmail.com',
            'phone' => 'kh3@gmail.com',
            'password' => bcrypt('kh3@gmail.com'),
            'remember_token' => '',
            'created_at' => date('Y-m-d h:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        // flight booking
        // `id`, `from`, `to`, `flight_id`, `departure`, `flight_type`, `return`, `total_person`, `user_id`, `flight_class_id`, `created_at`, `updated_at`
        DB::table('flight_booking')->insert([

            'from' => '1',
            'to' => '2',
            'flight_id' => '1',
            'departure' => '2019-01-01 09:30',
            'flight_type' => '1',
            'return' => '2019-01-02 09:30',
            'total_person' => '2',
            'user_id' => '1',
            'flight_class_id' => '1',

        ]);
        DB::table('flight_booking')->insert([
            'from' => '1',
            'to' => '2',
            'flight_id' => '1',
            'departure' => '2019-01-01 09:30',
            'flight_type' => '3',
            'return' => '2019-01-02 09:30',
            'total_person' => '4',
            'user_id' => '3',
            'flight_class_id' => '3',
        ]);
        DB::table('flight_booking')->insert([
            'from' => '1',
            'to' => '2',
            'flight_id' => '1',
            'departure' => '2019-01-01 09:30',
            'flight_type' => '1',
            'return' => '2019-01-02 09:30',
            'total_person' => '3',
            'user_id' => '2',
            'flight_class_id' => '2',
        ]);

    }
}
