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
  modTabs.directive('search', function(){
    return {
      restrict    : 'E',
      templateUrl : '/home/search.html',
    }
  });
  modTabs.directive('offer', function(){
    return {
      restrict    : 'E',
      templateUrl : '/home/offer.html',
    }
  });

})();