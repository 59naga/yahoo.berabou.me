app= angular.module 'yahoo',[
  'angular-loading-bar'
  'ui.router'
  
  'ngStorage'
  
  'ngMaterial'
  'ngAnimate'
]

# Environment
process.env.APP= 'yahoo'

# Global functions
app.run ($rootScope,$window,$localStorage)->
  $rootScope.move= (url)->
    $window.location.href= url
    return

  $rootScope.$storage= $localStorage.$default {
    words: 'UE4.8.3'
    period: 'd'
    ignoreDuplicateDomain: true
    scrollY: 0
  }

  # 非同期データ反映後のスクロール位置を記憶する
  # （これは座標を一度別の場所に保存して「データが反映」されたタイミングで復元する必要がある）
  $rootScope.$on '$stateChangeStart',->
    $rootScope.loaded= no
  $window.addEventListener 'scroll',->
    $localStorage.scrollY= $window.scrollY if $rootScope.loaded
    console.log $localStorage.scrollY,$rootScope.loaded

# Config angular material
app.config ($mdThemingProvider)->
  $mdThemingProvider
    .theme 'default'
    .primaryPalette 'pink'
    .accentPalette 'blue-grey'

# Attach application to <body>
angular.element(document).ready ->
  angular.bootstrap document,[process.env.APP]

module.exports= app
