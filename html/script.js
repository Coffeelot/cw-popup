window.addEventListener('message', function(data) {
    console.log(JSON.stringify(event.data))
    if (event.data.action == 'cwPopup') {
        $('.cwpopups').show();
        $('.cwpopups').animate({
            left: '250px',
            height: '+=150px',
            width: '+=150px'
        });
        $("#title").html(event.data.header);
        $(".popup-body").html(event.data.text);
    }
});

hidefunction = function() {
    $.post(`https://cw-popup/escape`)
    $('.cwpopups').animate({
            height: '-=150px',
            width: '-=150px'
        });;
    $('.cwpopups').hide();
}

document.onkeyup = function(event) {
    event = event || window.event;
    var charCode = event.keyCode || event.QBich;
    if (charCode == 27) { // Nui hide key backspace
        hidefunction()
    }
};
