<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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

    public function storeReview(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'place_id' => 'required',
            'rating' => 'required',
            'comment' => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->all()
            ], 422);
        }

        $review = Review::create($request->toArray());

        if ($review)
            return response()->json([
                'success' => true,
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Review not added'
            ], 500);
    }
}
