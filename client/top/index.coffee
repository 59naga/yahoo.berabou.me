module.exports= (items,$rootScope,$state,$window,$timeout)->
  viewModel= this

  viewModel.search= ->
    $state.go $state.current,{},{reload:yes}
    return

  # TODO: 「なんもないよ」の表示タイミングが変

  $rootScope.$watch '$storage.ignoreDuplicateDomain',(value)->
    viewModel.items=
      unless value
        items
      else
        domains= {}
        for item in items
          [schema,slash,domain,sub]= item.url.split '/'

          domains[domain]?= item

        (item for domain,item of domains)

    $timeout ->
      $window.scrollTo 0,$rootScope.$storage.scrollY
      $rootScope.loaded= yes

  $rootScope.$watch '$storage.period',(period,oldPeriod)->
    if period isnt oldPeriod
      $state.go $state.current,{},{reload:yes}

  viewModel

module.exports.resolve= 
  items: ($http,$localStorage)->
    api= 'http://yahoo.berabou.me/'
    safeWords= encodeURIComponent $localStorage.words
    queries=
      limit: 10
      concurrency: 5
      
    if $localStorage.period.length
      queries.vd= $localStorage.period

    uri= api+safeWords+'?'+(k+'='+(encodeURIComponent v)for k,v of queries).join '&'
    console.log uri

    $http.get uri
    .then (response)->
      if response.data instanceof Array
        response.data
      else
        null
