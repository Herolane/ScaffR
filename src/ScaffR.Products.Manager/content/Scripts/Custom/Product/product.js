function Product(data) {
    var self = this;
    self.Id = ko.observable(data.Id);
    self.Created = ko.observable(data.Created);
    self.RowVersion = ko.observable(data.RowVersion);
    self.Updated = ko.observable(data.Updated);

    self.Title = ko.observable(data.Title);
    self.SubTitle = ko.observable(data.SubTitle);
    self.MainDescription = ko.observable(data.MainDescription);
    self.SalesPrice = ko.observable(data.SalesPrice);
    self.CostPrice = ko.observable(data.CostPrice);
    self.ManufacturerNumber = ko.observable(data.ManufacturerNumber);

    self.Categories = ko.observableArray();
}

function Category(data) {
    var self = this;
    self.Id = ko.observable(data.Id);
    self.Name = ko.observable(data.Name);
}

function ViewModel() {
    var self = this;

    //self.current = ko.observable(new Product({}));
    self.current = ko.observable(null);
    self.Entities = ko.observableArray();
    self.CurrentPage = ko.observable(1);
    self.PageSize = ko.observable(10);
    self.Count = ko.observable();
    self.PagesCount = ko.observable();

    self.AllPages = ko.dependentObservable(function () {
        var pages = [];
        for (var i = 1; i <= self.PagesCount() ; i++) {
            pages.push({ pageNumber: (i) });
        }
        return pages;
    });
    self.NextPage = function () {
        if (self.CurrentPage() < self.PagesCount())
            self.GoToPage(self.CurrentPage() + 1);
    };
    self.Reload = function () {
        self.GoToPage(self.CurrentPage());
    };
    self.PrevPage = function () {
        if (self.CurrentPage() > 1)
            self.GoToPage(self.CurrentPage() - 1);
    };
    self.GoToPage = function (page) {
        $.ajax({
            url: '/api/products/page',
            type: 'GET',
            data: {
                page: page,
                pageSize: self.PageSize()
            },
            success: function (data) {
                self.CurrentPage(data.CurrentPage);
                self.PagesCount(data.PagesCount);
                self.Count(data.Count);

                var initData = [];
                $.each(data.Entities, function () {
                    initData.push(new Product(this));
                });

                self.Entities(initData);
            }
        });
    };

    self.newProduct = function () {
        self.current(new Product({}));
        $('#product-dialog').modal('show');
    };

    self.editProduct = function (product) {
        self.current(product);
        $('#product-dialog').modal('show');
    };

    self.deleteProduct = function (product) {
        var model = ko.toJS(product);

        if (confirm('Are you sure about delete this Product?')) {
            $.ajax({
                url: '/api/products/' + model.Id,
                type: 'DELETE',
                success: function (data) {
                    self.Reload();
                }
            });
        }
    };

    self.saveProduct = function () {
        var model = ko.toJS(self.current()),
            verb = model.Id ? 'PUT' : 'POST';

        $.ajax({
            url: '/api/products',
            type: verb,
            contentTYpe: 'application/json; charset=utf-8',
            data: model,
            success: function (data) {
                self.Reload();
                self.current(null);
                $('#product-dialog').modal('hide');
            }
        });
    };

    self.editCategories = function (product) {
        self.current(product);
        if (product.Categories().length) {
            $('#categories-dialog').modal('show');
        } else {
            $.ajax({
                url: '/api/products/categories/',
                type: 'GET',
                data: {
                    productId: product.Id()
                },
                success: function (data) {
                    console.log(data);
                    var initData = [];
                    $.each(data, function () {
                        initData.push(new Category(this));
                    });
                    product.Categories(initData);
                    $('#categories-dialog').modal('show');
                }
            });
        }
    };

    self.addCategory = function () {
        var value = $('#autoComplete').val(),
            cateId = mapped[value];

        console.log(self.current().Title());
        console.log(value);
        console.log(cateId);

        if (value) {
            $.ajax({
                url: '/api/products/AddCategory/',
                type: 'POST',
                data: {
                    productId: self.current().Id(),
                    categoryId: cateId
                },
                success: function (data) {
                    self.current().Categories.push(new Category({ Id: cateId, Name: value }));
                }
            });
        }
    };
}

var labels, mapped;
$(function () {
    $('#autoComplete').typeahead({
        source: function (query, process) {
            $.get('/api/categories/list', { q: query }, function (data) {
                labels = [];
                mapped = {};

                $.each(data, function (i, item) {
                    mapped[item.Name] = item.Id;
                    labels.push(item.Name);
                });

                process(labels);
            });
        }
    });

    var model = new ViewModel();
    ko.applyBindings(model);
    model.GoToPage(model.CurrentPage());
});