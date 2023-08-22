<?php

namespace App\Http\Controllers;

use App\Models\Fund;
use App\Models\Cash;
use Illuminate\Http\Request;
use DB;

class FundController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $funds = DB::table('funds')
                ->select('funds.id', 'funds.type', 'funds.published_at', 'funds.comment')
                ->selectRaw('SUM(cashes.nominal * cashes.quantity) as total')
                ->leftJoin('cashes', 'funds.id', '=', 'cashes.fund_id')
                ->groupBy('funds.id')
                ->get();
        $label_funds = array(
            'deposit' => 'Dépôt de caisse',
            'discount' => 'Remise en banque',
            'withdrawal' => 'Retrait',
        );
        return view('funds.index', compact('funds', 'label_funds'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('funds.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $fund = new Fund([
            'type' => $request->input('type_fund'),
            'published_at' => \Carbon\Carbon::parse($request->input('date'))->format('Y-m-d'),
            'comment' => $request->input('comment'),
            'user_id' => $request->user()->id
        ]);
        $fund = $request->user()->funds()->save($fund);
        $type_cashs = array();
        foreach ($request->input('type_cash') as $type_cash) {
            if(in_array($type_cash, $type_cashs)) continue;
            foreach ($request->input("nominal_$type_cash") as $i => $nominal) {
                $cash = new Cash([
                    'type' => $type_cash,
                    'nominal' => $nominal,
                    'quantity' => $request->input("quantity_$type_cash")[$i]
                ]);
                $cash = $fund->cashes()->save($cash);
            }
            $type_cashs[] = $type_cash;
        }
        \Session::flash('success','Successfully added.');
        return response()->json($fund);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Fund  $fund
     * @return \Illuminate\Http\Response
     */
    public function show(Fund $fund)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Fund  $fund
     * @return \Illuminate\Http\Response
     */
    public function edit(Fund $fund)
    {
        $fund = DB::table('funds')
                ->select('funds.id', 'funds.type', 'funds.published_at', 'funds.comment')
                ->selectRaw('SUM(cashes.nominal * cashes.quantity) as total')
                ->leftJoin('cashes', 'funds.id', '=', 'cashes.fund_id')
                ->where('funds.id', $fund->id)
                ->groupBy('funds.id')
                ->get()[0];
        return view('funds.edit', compact('fund'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fund  $fund
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fund $fund)
    {
        $fund->update([
            'published_at' => \Carbon\Carbon::parse($request->input('date'))->format('Y-m-d'),
            'comment' => $request->input('comment'),
        ]);
        $fund->cashes()->delete();
        $type_cashs = array();
        foreach ($request->input('type_cash') as $type_cash) {
            if(in_array($type_cash, $type_cashs)) continue;
            foreach ($request->input("nominal_$type_cash") as $i => $nominal) {
                $cash = new Cash([
                    'type' => $type_cash,
                    'nominal' => $nominal,
                    'quantity' => $request->input("quantity_$type_cash")[$i]
                ]);
                $cash = $fund->cashes()->save($cash);
            }
            $type_cashs[] = $type_cash;
        }
        \Session::flash('success','Successfully added.');
        return response()->json($fund);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fund  $fund
     * @return \Illuminate\Http\Response
     */
    public function destroy(Fund $fund)
    {
        $fund->delete();
        return response()->json($fund);
    }
}
