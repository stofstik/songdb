function addSong() {

    var newSong = {
        name: $("#song_name").val(),
        artist_id: $("#song_artist_id").val()
    };

    event.preventDefault();
    $.ajax({
            type: "POST",
            url: "/songs.json",
            data: JSON.stringify({
                song: newSong
            }),
            contentType: "application/json",
            dataType: "json"
        })
        .done(function(data) {
            console.log(data);
            var listItem = $('<div></div>')
                .addClass('list-item')
                .attr("id", 'song-' + data.id)
                .html(data.name);
            var button = $('<button></button>')
                .attr("type", 'button')
                .attr("onClick", 'deleteSong(' + data.id + ')')
                .html('Delete');
            listItem.append(button);
            $("#song-list").append(listItem);
        })
        .fail(function(error) {
            console.log(error);
        });
}

function deleteSong(songId) {
    $.ajax({
        type: "DELETE",
        url: "/songs/" + songId + ".json",
        contentType: "application/json",
        dataType: "json"
    })
    .done(function(data) {
        $('#song-' + songId).remove();
    });
}

$(document).ready(function() {
    $("form").bind('submit', addSong);
});
