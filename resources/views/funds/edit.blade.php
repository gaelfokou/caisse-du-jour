@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <form id="form" action="{{ route('funds.update', ['fund' => $fund->id]) }}" method="post">
                <fieldset>
                    <legend>Modifier cette entrée de fond de caisse</legend>
                    <hr>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label>Type d'opération</label>
                            <select name="type_fund" class="form-control" required>
                                <option value="deposit">Dépôt de caisse</option>
                                <option value="discount">Remise en banque</option>
                                <option value="withdrawal">Retrait</option>
                            </select>
                        </div>
                        <div class="col-sm-8">
                            <label class="pull-right total">{{ $fund->total ?? 0 }} €</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label>Date</label>
                            <input type="text" name="date" class="form-control datepicker" value="{{ \Carbon\Carbon::parse($fund->published_at)->format('d/m/Y') }}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8">
                            <label>Note</label>
                            <input type="text" name="comment" class="form-control" value="{{ $fund->comment}}" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Billets</legend>
                    <hr>
                    <div class="form-group row">
                        <input type="hidden" name="type_cash[]" value="cent">
                        <div class="col-sm-4">
                            <label>Nominal</label>
                            <select name="nominal_cent[]" class="form-control nominal" required>
                                <option value="1">1</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>Quantité</label>
                            <input type="number" name="quantity_cent[]" class="form-control quantity" value="0" min="0" required>
                        </div>
                        <div class="col-sm-4">
                            <label class="pull-right subtotal">0 €</label>
                        </div>
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-success btn-add">Ajouter</button>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Pièces</legend>
                    <hr>
                    <div class="form-group row">
                        <input type="hidden" name="type_cash[]" value="ticket">
                        <div class="col-sm-4">
                            <label>Nominal</label>
                            <select name="nominal_ticket[]" class="form-control nominal" required>
                                <option value="1">1</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>Quantité</label>
                            <input type="number" name="quantity_ticket[]" class="form-control quantity" value="0" min="0" required>
                        </div>
                        <div class="col-sm-4">
                            <label class="pull-right subtotal">0 €</label>
                        </div>
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-success btn-add">Ajouter</button>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Centimes</legend>
                    <hr>
                    <div class="form-group row">
                        <input type="hidden" name="type_cash[]" value="coin">
                        <div class="col-sm-4">
                            <label>Nominal</label>
                            <select name="nominal_coin[]" class="form-control nominal" required>
                                <option value="1">1</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>Quantité</label>
                            <input type="number" name="quantity_coin[]" class="form-control quantity" value="0" min="0" required>
                        </div>
                        <div class="col-sm-4">
                            <label class="pull-right subtotal">0 €</label>
                        </div>
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-success btn-add">Ajouter</button>
                        </div>
                    </div>
                </fieldset>
                <div class="col-sm-4 offset-sm-4">
                    <button type="submit" class="btn btn-dark">Modifier</button>
                </div>
            </form>
    	</div>        
	</div>
</div>
@endsection

@section('footer-scripts')
<script type="text/javascript">
    function sumTotal() {
        var total = 0;
        var field = $(document).find('.btn-add,.btn-remove').closest('.form-group');
        field.each(function(i, elt) {
            console.log(i);
            total += parseInt($(this).find('select.nominal').val()) * parseInt($(this).find('input.quantity').val());
        });
        $(document).find('.total').text(total+' €');
    }

    (function($) {
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('.datepicker').datepicker();

            var field = $(document).find('.btn-add').closest('.form-group');
            field.find('.subtotal').text((parseInt(field.find('select.nominal').val()) * parseInt(field.find('input.quantity').val()))+' €');

            field.find('select.nominal').on('change', function(event) {
                $(this).closest('.form-group').find('.subtotal').text((parseInt($(this).val()) * parseInt($(this).closest('.form-group').find('input.quantity').val()))+' €');
                sumTotal();
            });

            field.find('input.quantity').on('change', function(event) {
                $(this).closest('.form-group').find('.subtotal').text((parseInt($(this).val()) * parseInt($(this).closest('.form-group').find('select.nominal').val()))+' €');
                sumTotal();
            });

            $(document).on('click', '.btn-add', function(event) {
                event.preventDefault();

                field = $(this).closest('.form-group');

                var field_new = field.clone();

                $(this)
                    .toggleClass('btn-success')
                    .toggleClass('btn-add')
                    .toggleClass('btn-danger')
                    .toggleClass('btn-remove')
                    .html('Supprimer');

                field_new.find('select.nominal').val(1);

                field_new.find('select.nominal').on('change', function(event) {
                    $(this).closest('.form-group').find('.subtotal').text((parseInt($(this).val()) * parseInt($(this).closest('.form-group').find('input.quantity').val()))+' €');
                    sumTotal();
                });

                field_new.find('input.quantity').val(0);

                field_new.find('input.quantity').on('change', function(event) {
                    $(this).closest('.form-group').find('.subtotal').text((parseInt($(this).val()) * parseInt($(this).closest('.form-group').find('select.nominal').val()))+' €');
                    sumTotal();
                });

                field_new.find('.subtotal').text('0 €');

                field_new.insertAfter(field);
            });

            $(document).on('click', '.btn-remove', function(event) {
                event.preventDefault();
                $(this).closest('.form-group').remove();
                sumTotal();
            });

            $(document).on('click', '.close', function(event) {
                $(this).closest('.alert').remove();
            });

            $('#form').on('submit', function(event) {
                event.preventDefault();
                var form = $(this);
                var formdata = false;
                if (window.FormData){
                    formdata = new FormData(form[0]);
                }

                var formAction = form.attr('action');
                $.ajax({
                    url: formAction,
                    data: formdata ? formdata : form.serialize(),
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'PUT',
                    success: function(data, textStatus, jqXHR){
                        window.location.href = "{{ route('funds.index') }}";
                    }
                });
            });
        });
    })(jQuery);

</script>
@endsection
