$(document).ready(function () {


  $("#search-box").autocomplete({
    source: get_results_sb,
    minLength: 2,
    select: function (event, ui) {
              event.preventDefault();
              console.log(ui);
              return false;
            }
  })
  .data("ui-autocomplete")._renderItem = function (ul, item) {
    $(".ui-corner-all").removeClass("ui-corner-all");
    return $("<li>")
                    .append("<a><img src=" + item.image_url + "></img>" + 
                      "<div style='display: inline-block;'> <span class=title><span class=search-term></span>" + item.book.title + "</span> <br />" +
                            // "<p class=edition>" + item.book.edition +"</p>" +
                            "<span class=author>" + item.book.author + "</span>, " +
                            "<span class=publisher>" + item.book.publisher + " Publications </span>" +
                      "</div></a>").appendTo(ul);
  };

  function get_results_sb(request, response) {
    console.log(request.term)
    var params = {
      keywords: request.term
    };
    $.get("/queries/json_completion", params, function (data) {
      console.log(data)
      response(data);
    }, "json");
  }






  // $("button.clear").on('click', function(e) {
  //   e.preventDefault();
  //   console.log("clicked")
  //   console.log($("div.result-item"));
  //   $("div.search-result").slideUp();
  //   $("div.item-info").slideUp();
  //   return false;
  // });

  // $("button.select").on('click', function(e) {
  //   e.preventDefault();
  //   console.log("clicked");
  //     $("div.item-info").slideDown();


  //   var $item       = $(".auto.result-item > .ibox-content");
  //   var title       = $item.find("h4").text();
  //   var edition     = $item.find(".edition .val").text();
  //   var publisher   = $item.find(".publisher .val").text();
  //   var isbn10      = $item.find(".isbn10 .val").text();
  //   var isbn13      = $item.find(".isbn13 .val").text();
    
  //   console.log(title)
  //   console.log(edition)
  //   console.log(publisher)
  //   console.log(isbn10)
  //   console.log(isbn13)


  //   var $form = $("form.listing-form");
  //   console.log($form)
  //   console.log($form.find("input.title"));
  //   $form.find("input.title").val(title);
  //   $form.find("input.edition").val(edition);
  //   $form.find("input.publisher").val(publisher);
  //   $form.find("input.isbn10").val(isbn10);
  //   $form.find("input.isbn13").val(isbn13);
  // });

});