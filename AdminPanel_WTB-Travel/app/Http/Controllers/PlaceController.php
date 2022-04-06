<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Place;

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
            'src' => 'required',
        ]);

        // menyimpan data file yang diupload ke variabel $file
        $file = $request->file('src');

        if ($file->getClientOriginalExtension() === 'jpg' && $file->getSize() <= 500000) {
            // isi dengan nama folder tempat kemana file diupload
            $tujuan_upload = 'assets\img';
            // upload file
            $file->move($tujuan_upload, $file->getClientOriginalName());
            $validated['src'] = "assets/img/" . $file->getClientOriginalName();
            Place::create($validated);
            return redirect('/places')->with('alert', 'Place added successfully!');
        } else {
            if ($file->getClientOriginalExtension() !== 'jpg') {
                return redirect('/places/create')->with('alert', 'The file type can only be JPG!');
            } else if ($file->getSize() > 500000) {
                return redirect('/places/create')->with('alert', 'Maximum file size 500 KB');
            }
        }
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
