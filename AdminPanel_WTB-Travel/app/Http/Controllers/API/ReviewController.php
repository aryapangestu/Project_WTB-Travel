<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $reviews = Review::all();
        foreach ($reviews as $key => $review) {
            $reviews[$key]['user_name'] = $review->user->username;
            unset($reviews[$key]['user']);
        }

        return response()->json($reviews);
    }

    public function getReview($id)
    {
        $reviews = Review::where('place_id', $id)->get();
        foreach ($reviews as $key => $review) {
            $reviews[$key]['user_name'] = $review->user->username;
            unset($reviews[$key]['user']);
        }
        return response()->json($reviews);
    }
}
