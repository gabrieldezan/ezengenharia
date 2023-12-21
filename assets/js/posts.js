var vsUrl = $("#vsUrl").val();

$(document).ready(function () {

    // Load more data
    $('.mais-posts').click(function () {
        var row = Number($('#row').val());
        var allcount = Number($('#all').val());
        var rowperpage = 4;
        row = row + rowperpage;

        if (row <= allcount) {
            $("#row").val(row);

            $.ajax({
                url: vsUrl + "pages/mais-posts.php",
                type: 'post',
                data: { row: row },
                beforeSend: function () {
                    $(".mais-posts").text("Carregando...");
                },
                success: function (response) {

                    // Setting little delay while displaying new content
                    setTimeout(function () {
                        // appending posts after last post with class="post"
                        $(".post:last").after(response).show().fadeIn("slow");

                        var rowno = row + rowperpage;

                        // checking row value is greater than allcount or not
                        if (rowno > allcount) {
                            $('.mais-posts').css("display", "none");
                        } else {
                            $(".mais-posts").text("Ver mais");
                        }
                    }, 2000);

                }
            });
        } else {
            $('.mais-posts').text("Carregando...");

            // Setting little delay while removing contents
            setTimeout(function () {

                // When row is greater than allcount then remove all class='post' element after 3 element
                $('.post:nth-child(4)').nextAll('.post').remove();

                // Reset the value of row
                $("#row").val(0);

                // Change the text and background
                $('.mais-posts').text("Ver mais");

            }, 2000);
        }

    });

});