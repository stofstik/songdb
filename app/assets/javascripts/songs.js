function deleteSong(songId) {
    $.ajax({
        type: "DELETE",
        url: "/songs/" + songId + ".json",
        contentType: "application/json",
        dataType: "json"
    })

    .done(function(data) {
        $('#song-' + songId ).remove();
    });
}


$(document).ready(function() {
});
