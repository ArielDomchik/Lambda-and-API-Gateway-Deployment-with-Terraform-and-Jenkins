exports.handler = function (event, context, callback) {
  var response = {
    statusCode: 200,
    headers: {
      'Content-Type': 'text/html; charset=utf-8',
    },
    body: '<h2>Hello world...Welcome to LEUMI, New version!</h2>',
  }
  callback(null, response)
}
