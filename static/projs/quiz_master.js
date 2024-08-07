$(document).ready(function(){

    $('#myDropdowni').select2({
        dropdownParent: $('#addNewModal')
    });

    loadQuiztonList();

    $(document).on('click','.editQuizton', function(){
        url = $(this).data('url');
        class_level = $(this).data('classlevel');
        $('#addNewModal').modal('show');
        // When the modal is fully shown, perform actions on the dropdown
        $('#addNewModal').on('shown.bs.modal', function () {
          $('#classLevel').val(class_level);
          $('#quizForm').attr('data-action', url);
        });
    })

    $(document).on('click','#addQuizton', function(){
        $('#addNewModal').modal('show')
    })

    function loadQuiztonList(){
        url = $('#quiztonList').data('url');
        csrf_token = $('#csrf_token').val();
        console.log(url);
        $.ajax({
            url : url,
            type: 'POST',
            data:{'csrfmiddlewaretoken':csrf_token},
            success: function(data){
                $('#quiztonList').html(data)
                $('#quizTable').DataTable();
            }
        })
    }
    // $('#addNewModal').on('shown.bs.modal', function () {
    //     $('#myDropdowni').select2({
    //         dropdownParent: $('#addNewModal')
    //     });
    // });

    $('#quizForm').on('submit', function(e){

        var classLevel = $('#classLevel').val();
        if(classLevel == ''){
            toastmessage('error', 'Class Level is mandatory')
        }

        e.preventDefault();
        path = $(this).data('action');
        alert(path);
        var formData = new FormData(this);
        $.ajax({
            url : path,
            type: 'POST',
            data:  formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if(data.status==200)
                {
                    loadQuiztonList();
                    toastmessage('success', data.msg)
                      $('#quizForm')[0].reset();
                    $('#addNewModal').modal('hide')
                }
                else
                {
                    toastmessage('error', data.msg)
                }
            }
        })
    })

    $(document).on('click','.viewQuizImage', function(){
        var img = $(this).data('imageurl');
        console.log(img);
        $("#quiz_image_body").attr("src",img)
        $('#quizImageModal').modal('show')
    })


    $(document).on('click', '.playButton', function () {
        var video = $(this).siblings('.myVideo')[0];
        var playButton = $(this)[0];

        // Request full screen
        if (video.requestFullscreen) {
            video.requestFullscreen();
        } else if (video.mozRequestFullScreen) { // Firefox
            video.mozRequestFullScreen();
        } else if (video.webkitRequestFullscreen) { // Chrome, Safari and Opera
            video.webkitRequestFullscreen();
        } else if (video.msRequestFullscreen) { // IE/Edge
            video.msRequestFullscreen();
        }
        // Play the video
        video.play();

        // Remove the blur by adding the 'playing' class
        video.classList.add('playing');

        // Hide the play button
        playButton.classList.add('hidden');
    });

    $(document).on('play', '.myVideo', function () {
        var video = $(this)[0];
        var playButton = $(this).siblings('.playButton')[0];

        // Remove the blur by adding the 'playing' class
        video.classList.add('playing');

        // Hide the play button
        playButton.classList.add('hidden');
    });





})
