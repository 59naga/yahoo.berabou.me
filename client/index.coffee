# Dependencies
app= require './app'

# Routes
app.config ($urlRouterProvider)->
  $urlRouterProvider.when '','/'

app.config ($stateProvider)->
  $stateProvider.state 'root',
    views:
      header:
        template: require './root/header.jade'
        controller: require './root/header.coffee'
        controllerAs: 'header'
      footer:
        template: require './root/footer.jade'
        controller: require './root/footer.coffee'
        controllerAs: 'footer'

app.config ($stateProvider)->
  $stateProvider.state 'root.top',
    url: '/:words'
    resolve: (require './top/index.coffee').resolve
    views:
      'container@':
        template: require './top/index.jade'
        controller: require './top/index.coffee'
        controllerAs: 'top'

