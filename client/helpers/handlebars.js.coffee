Handlebars.registerHelper 'pluralize', (n, thing) ->
  # fairly stupid pluralizer
  console.log n
  if (n == 1)
    return '1 ' + thing
  else
    return n + ' ' + thing + 's'