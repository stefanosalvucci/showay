(function(){

  var modTabs = angular.module('modTabs', []);

  modTabs.controller('tabController', function(){
    this.tab = 1;

    this.selectTab = function(newTab){
      this.tab = newTab;
    };

    this.isSelected = function(checkTab){
      return this.tab === checkTab;
    };
  });

  /**************** TAB ********************/
  modTabs.directive('home', function(){
    return {
      restrict    : 'E',
      templateUrl : '/home/home.html',
    }
  });
  modTabs.directive('about', function(){
    return {
      restrict    : 'E',
      templateUrl : '/home/about.html',
    }
  });
  modTabs.directive('contact', function(){
    return {
      restrict    : 'E',
      templateUrl : '/home/contact.html',
    }
  });

})();