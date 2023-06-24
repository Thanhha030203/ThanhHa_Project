var app = angular.module("myApp", ["ngRoute"]);
app.config(function ($routeProvider) {
    $routeProvider
        .when("/list-account", {
            templateUrl: "list-account.html"
        })
        .when("/list-book", {
            templateUrl: "list-book.html"
        })
        .when("/new-account", {
            templateUrl: "new-account.html"
        })
        .when("/new-book", {
            templateUrl: "new-book.html"
        })
        .otherwise({
            redirectTo: "/index"
        })
});
app.run(function ($rootScope) {
    $rootScope.$on('routeChangeStart', function () {
        $rootScope.loading = true;

    });
    $rootScope.$on('routeChangeSuccess', function () {
        $rootScope.loading = false;

    });
    $rootScope.$on('routeChangeError', function () {
        $rootScope.loading = false;
        alert("Lỗi , Không Tải được")

    });
});
app.controller("myctrl1", function ($scope, $http) {
    // $scope.products = list;

    // $scope.begin = 0;
    // $scope.pageCount = Math.ceil($scope.products.length / 8);
    // $scope.first = function () {
    //     $scope.begin = 0;
    // }
    // $scope.prev = function () {
    //     if ($scope.begin > 0) {
    //         $scope.begin -= 8

    //     }
    // }
    // $scope.next = function () {
    //     if ($scope.begin < ($scope.pageCount - 1) * 8) {
    //         $scope.begin += 8;
    //     }
    // }
    // $scope.last = function () {
    //     $scope.begin = ($scope.pageCount - 1) * 8;
    // }
    // $scope.kiemtra = function () {
        
    //         alert("Nhập thành công!")
        
    // }
});
