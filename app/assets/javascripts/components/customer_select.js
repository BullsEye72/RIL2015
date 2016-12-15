$(function () {

    var $modalElt = $('#userSelectionModal');

    $('#chooseCustomerButton').on('click', function () {
        $modalElt.modal();
    });

    $('#userSelectionModal tbody tr').on('click', function () {
        $('#project_customer_id').val($(this).data('customer-id'));
        $('#customer').val($(this).data('firstname') + ' ' + $(this).data('lastname'));
        $modalElt.modal('hide');
    });

    $modalElt.find('thead input').on('input', applyFilter);

    function applyFilter() {
        var firstNameFilterContent = clean($modalElt.find('#customer_firstname').val());
        var lastNameFilterContent = clean($modalElt.find('#customer_lastname').val());
        var phoneFilterContent = clean($modalElt.find('#customer_phone').val());
        var $tr = $modalElt.find('tbody tr');

        $tr.show();
        $tr.each(function (index, trElt) {
            var currentElt = $(trElt);
            if (
                clean(currentElt.find('.customer_firstname').text()).indexOf(firstNameFilterContent) == -1 ||
                clean(currentElt.find('.customer_lastname').text()).indexOf(lastNameFilterContent) == -1 ||
                clean(currentElt.find('.customer_phone').text()).indexOf(phoneFilterContent) == -1

            ) currentElt.hide();
        });
    }

    function clean(string) {
        return string.split(' ').join().toLowerCase()
    }
});
