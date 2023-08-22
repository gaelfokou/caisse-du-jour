@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <legend>Total caisse</legend>
            <hr>
            <label class="total">{{ array_reduce($funds->toArray(), function($carry, $item) {
                return $carry + ($item->total ?? 0);
            }) }} €</label>
        </div>
        <div class="col-sm-9">
            <legend>Opérations du jour</legend>
            <hr>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Date</th>
                    <th scope="col">Type</th>
                    <th scope="col">Note</th>
                    <th scope="col">Total</th>
                    <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($funds as $fund)
                        <tr>
                            <th scope="row">{{ $fund->id }}</th>
                            <td>{{ \Carbon\Carbon::parse($fund->published_at)->format('d/m/Y') }}</td>
                            <td>{{ $label_funds[$fund->type] }}</td>
                            <td>{{ $fund->comment}}</td>
                            <td>{{ $fund->total ?? 0 }}</td>
                            <td>
                            <a href="{{ route('funds.edit', ['fund' => $fund->id]) }}" class="btn-add"><button type="button" class="btn btn-success">Modifier</button></a>
                            <a href="{{ route('funds.destroy', ['fund' => $fund->id]) }}" class="btn-remove"><button type="button" class="btn btn-danger">Supprimer</button></a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
    	</div>        
	</div>
</div>
@endsection

@section('footer-scripts')
<script type="text/javascript">
    (function($) {
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $(document).on('click', '.btn-remove', function(event) {
                event.preventDefault();

                var href = $(this);
                $.ajax({
                    url: href.attr('href'),
                    type: 'DELETE',
                    success: function(data, textStatus, jqXHR){
                        href.closest('tr').remove();
                    }
                });
            });
        });
    })(jQuery);

</script>
@endsection
