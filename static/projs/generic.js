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
                $('.select2').select2({
                    dropdownParent: $('#commonModal'),
                    width: '100%'
                });

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
                else if (data.status == 400) {
                    toastmessage('error', data.msg)
                }
                else {
                    $('.modal-content').html(data)
                }
            }
        })
    })

    $(document).on('click', '.delete-btn', function () {
        url = $(this).data('url');
        $.ajax({
            url: url,
            type: 'GET',
            success: function (data) {
                toastmessage('success', data.msg);
                loadData();
            }
        })
    })
})

$(document).on('change', '.ajaxDn', function() {
    var classId = $(this).val();
    $.ajax({
        url: 'get-students-by-class',  // URL for the view
        data: {
            'class_id': classId
        },
        dataType: 'json',
        success: function(data) {
            $('.ajaxChild').empty();  // Clear existing options
            $.each(data, function(index, student) {
                $('.ajaxChild').append(new Option(student.name, student.id));
            });
        }
    });
});