// Use the Google API Loader script to load the google.picker script.
function loadPicker() {
    gapi.load('picker', {'callback': createPicker});
}

// Use your own API developer key.
var developerKey = "AIzaSyCnqRCNjJfwV6CvRIfaY_NeHIfEUflJC7Y";

var picker;

// Create and render a Picker object for searching images.
function createPicker() {
    var view = new google.picker.View(google.picker.ViewId.DOCS);
    view.setMimeTypes("image/png,image/jpeg,image/jpg,image/svg+xml,text/html,text/plain,application/rtf,application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/x-vnd.oasis.opendocument.spreadsheet,application/octet-stream");
    picker = new google.picker.PickerBuilder()
            .enableFeature(google.picker.Feature.NAV_HIDDEN)
            .enableFeature(google.picker.Feature.MULTISELECT_ENABLED)
            .setAppId("my-app-id")
            .setOAuthToken(myAuthToken)
            .addView(view)
            .addView(new google.picker.DocsUploadView())
            .setDeveloperKey(developerKey)
            .setCallback(pickerCallback)
            .build();
     picker.setVisible(false);
}

// A simple callback implementation.
function pickerCallback(data) {
    if (data.action == google.picker.Action.PICKED) {
        var file = data.docs[0];
        $("#name").val(file.name);
        $("#file_name_static").html(file.name);
        $("#file_id").val(file.id);
        console.log(data.docs);
        // alert('The user selected: ' + fileId);
    }
}

var ready1 = function() {
    if ($('#image-pick-link').length > 0) {
        loadPicker();

        $("#image-pick-link").click(function(e) {
            picker.setVisible(true);
        });
    }
}

$(document).ready(ready1);
$(document).on('page:load', ready1);