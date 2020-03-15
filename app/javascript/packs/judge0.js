function result(token, callback) {
  $.ajax({
    url: "https://api.judge0.com/submissions/" + token,
    type: "GET",
    success: function (data) {
      if (data.status.id <= 2) { // In Queue or Processing
        setTimeout(() => {
          result(token, callback);
        }, 250);
        return;
      }

      callback(data);
    }
  })
}

function token(params, callback) {
  $.ajax ({
    url: "https://api.judge0.com/submissions",
    type: "POST",
    data: params
  }).done(function(data) {
    result(data.token, callback);
  }).fail(function(data, err) {
    alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err));
  })
}

export function run(params, callback) {
  token(params, callback);
}