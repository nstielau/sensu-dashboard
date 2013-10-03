namespace "SensuDashboard.Models", (exports) ->

  class exports.Check extends Backbone.Model

    defaults:
      handlers: ["default"]
      standalone: false
      subscribers: []
      interval: 60

    idAttribute: "name"

    publish: (options = {}) ->
      @successCallback = options.success
      @errorCallback = options.error
      request_body = {
        "check": @get('name'),
        "subscribers": @get('subscribers')
      }
      $.post '/check/request',
             JSON.stringify(request_body),
             @successCallback,
             'json'