<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\Place;
use App\Models\User;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('reviews.index', [
            "title" => "Review Place",
            "reviews" => Review::all(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('reviews.create', [
            "title" => "Review Place",
            "reviews" => Review::all(),
            "users" => User::all(),
            "places" => Place::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validated = $request->validate([
            'user_id' => 'required',
            'place_id' => 'required',
            'rating' => 'required',
            'comment' => 'required|max:255',
        ]);

        Review::create($validated);
        return redirect('/reviews')->with('alert', 'review added successfully!');
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('reviews.edit', [
            "title" => "Edit Review",
            "review" => Review::find($id),
            "users" => User::all(),
            "places" => Place::all(),
        ]);
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
        $validated = $request->validate([
            'user_id' => 'required',
            'place_id' => 'required',
            'rating' => 'required',
            'comment' => 'required|max:255',
        ]);

        Review::where('id', $id)->update($validated);
        return redirect('/reviews')->with('alert', 'review updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Review::destroy($id);
        return redirect('/reviews')->with('alert', 'Review deleted successfully!');
    }
}
