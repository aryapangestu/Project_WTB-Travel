<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('Users.index', [
            "title" => "Users",
            "users" => User::all(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Users.create', [
            "title" => "Create Users",
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
            'username' => ['required'],
            'password' => ['required'],
        ]);

        $validated['password'] = Hash::make($validated['password']);

        User::create($validated);
        return redirect('/users')->with('alert', 'User added successfully!');
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
    public function updateUserStatus($id)
    {
        if (User::find($id)->status === 1) {
            $update = array('status' => 0);
        } else {
            $update = array('status' => 1);
        }
        User::where('id', $id)->update($update);
        return;
    }
    public function updateUserAdmin($id)
    {
        if (User::find($id)->is_admin === 1) {
            $update = array('is_admin' => 0);
        } else {
            $update = array('is_admin' => 1);
        }
        User::where('id', $id)->update($update);
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
        User::destroy($id);
        return redirect('/users')->with('alert', 'User deleted successfully!');
    }
}
