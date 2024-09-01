$(document).ready(function(){
   

    $("#eventTable").DataTable();

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
})