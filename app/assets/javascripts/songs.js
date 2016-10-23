/*
 * Add a song to the database using an AJAX cal
 */
function addSong() {
    event.preventDefault();

    // Get data form our form
    var newSong = {
        name: $("#song_name").val(),
        artist_id: $("#song_artist_id").val()
    };

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
        // Create our list-item html element ( Can't wait for React :'D )
        var listItem = $('<div></div>')
            .addClass('list-item')
            .attr("id", 'song-' + data.id)
            .html(data.name);
        var button = $('<button></button>')
            .attr("type", 'button')
            .attr("onClick", 'deleteSong(' + data.id + ')')
            .html('Delete');
        listItem.append(button);
        // Add it to our list
        $("#song-list").append(listItem);
    })
    .fail(function(error) {
        console.log(error);
    });
}

/*
 * Delete a song by id
 */
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

/*
 * Delete all songs by iterating, ideally we would have a custom method in our controller
 */
function deleteAll() {
    event.preventDefault();
    if (confirm("Are you sure you want to delete all songs?")) {
        // Use jQuery to iterate over each list-item
        $.each($(".list-item"), function(index, listItem) {
            // Get the value of 'id'
            var id = $(listItem).attr('id');
            // Use substring to get the id number instead of 'song-##'
            deleteSong(id.substring(id.indexOf('-') + 1, id.length));
        });
    }
}

/*
 * Bind addSong to our form submit, we use regular onClick methods for the buttons
 */
$(document).ready(function() {
    $("form").bind('submit', addSong);
});
