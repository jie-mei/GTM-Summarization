$(function() {

    // Update percentage once new slider moved.
    $('#slider').on('change', function() {
        $('#percent').html($('#slider').val());
    })

    // Update input textarea once new file selected.
    $('#in_file').on('change', function() {
        var files = !!this.files ? this.files : [];
        if (!files.length) { return; }
        var reader = new FileReader();
        reader.readAsText(files[0]);
        reader.onloadend = function(evt) {
            if (evt.target.readyState = FileReader.DONE) {
                $('#in_text').val(evt.target.result);
            }
        }
    });
    $('#stop_file').on('change', function() {
        var files = !!this.files ? this.files : [];
        if (!files.length) { return; }
        var reader = new FileReader();
        reader.readAsText(files[0]);
        reader.onloadend = function(evt) {
            if (evt.target.readyState = FileReader.DONE) {
                $('#stop_text').val(evt.target.result);
            }
        }
    });

    // Process once run button clicked.
    $('#run').click(function() {
        if ($('#in_text').val().length == 0) {
            alert("Please enter your input text.");
        } else {
            $.ajax({
                type: 'POST',
                url: 'SummarizationServlet',
                data: {
                    input:   $('#in_text').val(),
                    stop:    $('#stop_text').val(),
                    percent: $('#percent').html()
                },
                dataType: 'text',
                success: function(response) {
                    $('#out_text').val(response);
                    $('#download').css("visibility", "visible");;
                }
            });
        }
    });
})
