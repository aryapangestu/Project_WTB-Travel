<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Auth::user());
    }

    public function updateUsername(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255|unique:users',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->all()
            ], 422);
        }

        $user = User::where('id', $id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found'
            ], 400);
        }

        $updated = User::where('id', $id)->update($request->toArray());

        if ($updated)
            return response()->json([
                'success' => true,
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Username can not be updated'
            ], 500);
    }

    public function updatePassword(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->all()
            ], 422);
        }

        $request['password'] = Hash::make($request['password']);
        $user = User::where('id', $id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found'
            ], 400);
        }

        $updated = User::where('id', $id)->update($request->toArray());

        if ($updated)
            return response()->json([
                'success' => true,
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Password can not be updated'
            ], 500);
    }
}