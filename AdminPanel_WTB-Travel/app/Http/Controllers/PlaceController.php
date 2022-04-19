<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Place;
use Illuminate\Support\Facades\File;

class PlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('places.index', [
            "title" => "Places",
            "places" => Place::all(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('places.create', [
            "title" => "Create Place",
            "categories" => Category::all(),
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
            'name' => 'required|max:255',
            'description' => 'required',
            'category_id' => 'required',
            'lat' => 'required',
            'lng' => 'required',
            'src' => 'required|file|max:500',
        ]);

        if ($request->file('src')) {
            $validated['src'] = $request->file('src')->store('place-img');
        }

        Place::create($validated);
        return redirect('/places')->with('alert', 'Place added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('places.view', [
            "title" => "Show Place",
            "categories" => Category::all(),
            "place" => Place::find($id),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('places.edit', [
            "title" => "Edit Place",
            "categories" => Category::all(),
            "place" => Place::find($id),
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
            'name' => 'required|max:255',
            'description' => 'required',
            'category_id' => 'required',
            'lat' => 'required',
            'lng' => 'required',
        ]);

        if ($request->file('src')) {
            $validated['src'] = $request->file('src')->store('place-img');
            $locImg = "storage/" . Place::find($id)->src;
            File::delete($locImg);
        }

        Place::where('id', $id)->update($validated);
        return redirect('/places')->with('alert', 'Place updated successfully!');
    }

    public function updatePlaceStatus($id)
    {
        if (Place::find($id)->status === 1) {
            $update = array('status' => 0);
        } else {
            $update = array('status' => 1);
        }
        Place::where('id', $id)->update($update);
        return;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $locImg = "storage/" . Place::find($id)->src;
        File::delete($locImg);
        Place::destroy($id);
        return redirect('/places')->with('alert', 'Place deleted successfully!');
    }
}
