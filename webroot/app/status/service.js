 app.factory("Status", function($resource) {
  return $resource( api + "status/:id", { id: '@id', search: '@search' }, {
    query: { method: 'GET', isArray: false },
    update: { method: 'PUT' },
    search: { method: 'GET' },
  });
});
