<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Place;
use App\Models\Review;
use Illuminate\Http\Request;

class PlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $places = Place::where('status', true)->orderBy('view', 'desc')->get();

        foreach ($places as $key => $place) {
            $sumRate = 0;
            $countRate = 0;
            foreach (Review::where('place_id', $place->id)->get() as $item) {
                $sumRate = $sumRate + $item->rating;
                $countRate = $countRate + 1;
            }
            if ($countRate == 0) {
                $avgRate = 0;
            } else {
                $avgRate = $sumRate / $countRate;
                $avgRate = round($avgRate, 1);
            }

            $places[$key]['src'] = asset('storage/' . $place->src);
            $places[$key]['comments'] = (string)$countRate;
            $places[$key]['rating'] = (string)$avgRate;
        }

        return response()->json($places);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
