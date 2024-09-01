$(document).ready(function(){
   
    loadData();

    function loadData() {
        url = $('.dataBody').data('url');
        $.ajax({
            url: url,
            type: 'GET',
            success: function (data) {
                $('.dataBody').html(data)
                $('#commonTable').DataTable();
            }
        })
    }

    $(document).on('click', '.btn-modal', function () {
        url = $(this).data('url');
        $.ajax({
            url: url,
            type: 'GET',
            success: function (data) {
                $('.modal-content').html(data)
                $('#commonModal').modal('show')
            }
        })
    })

    $(document).on('click', '.commonSubmit',function (e) {
        e.preventDefault();
        var form = $('#commonForm');
        var path = form.data('action');
        var formData = new FormData(form[0]);
        $.ajax({
            url: path,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.status == 200) {
                    toastmessage('success', data.msg)
                    $('#commonForm')[0].reset();
                    $('#commonModal').modal('hide');
                    loadData();
                }
                else {
                    $('.modal-content').html(data)
                }
            }
        })
    })
})