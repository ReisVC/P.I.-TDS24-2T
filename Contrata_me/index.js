var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var User = /** @class */ (function () {
    function User(name, birth, address, cnpj_cpf) {
        this.name = name,
            this.birth = birth,
            this.address = address,
            this.cnpj_cpf = cnpj_cpf;
    }
    User.prototype.getName = function () {
        return this.name;
    };
    User.prototype.setName = function (newName) {
        this.name = newName;
    };
    User.prototype.getCnpj_cpf = function () {
        return this.cnpj_cpf;
    };
    User.prototype.setCnpj_cpf = function (value) {
        this.cnpj_cpf = value;
    };
    User.prototype.getAddress = function () {
        return this.address;
    };
    User.prototype.setAddress = function (value) {
        this.address = value;
    };
    User.prototype.getbirth = function () {
        return this.birth;
    };
    User.prototype.getEmail = function () {
        return this.email;
    };
    User.prototype.setEmail = function (value) {
        this.email = value;
    };
    return User;
}());
var Provider = /** @class */ (function (_super) {
    __extends(Provider, _super);
    function Provider(name, birth, address, cnpj_cpf, email) {
        return _super.call(this, name, birth, address, cnpj_cpf) || this;
    }
    Provider.prototype.create_service = function (service, value, date) {
        service.setPrice(value);
        service.setWorkload;
    };
    return Provider;
}(User));
var Category = /** @class */ (function () {
    function Category(name_category, description_Category) {
        this.description_Category = description_Category;
        this.name_category = name_category;
    }
    return Category;
}());
var Client = /** @class */ (function (_super) {
    __extends(Client, _super);
    function Client(name, birth, address, cnpj_cpf, email) {
        return _super.call(this, name, birth, address, cnpj_cpf) || this;
    }
    Client.prototype.contracted_service = function (service) {
        this.service_hired.push(service);
    };
    return Client;
}(User));
var Service = /** @class */ (function () {
    function Service(type, description) {
        this.type = type;
        this.description = description;
    }
    Service.prototype.getType = function () {
        return this.type;
    };
    Service.prototype.setType = function (value) {
        this.type = value;
    };
    Service.prototype.getPrice = function () {
        return this.price;
    };
    Service.prototype.setPrice = function (value) {
        this.price = value;
    };
    Service.prototype.getDescription = function () {
        return this.description;
    };
    Service.prototype.setDescription = function (value) {
        this.description = value;
    };
    Service.prototype.getWorkload = function () {
        return this.workload;
    };
    Service.prototype.setWorkload = function (value) {
        this.workload = value;
    };
    return Service;
}());
var Workload = /** @class */ (function () {
    function Workload() {
        this.todayte = new Date();
    }
    Workload.prototype.formateDate = function (data) {
        return data.toLocaleString('pt-BR', {
            weekday: 'short', year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: 'numeric'
        });
    };
    Workload.prototype.addDays = function (day) {
        var newDeadline = new Date(); //cria uma var onde salva o a data de hoje
        newDeadline.setDate(newDeadline.getDate() + day); //adiciona o número de dias a partir da data de hoje
        return newDeadline; // retorna o novo prazo 
    };
    Workload.prototype.deadlineDays = function (day) {
        var deadline = this.addDays(day);
        return "Prazo de atendimento: ".concat(day, " dias");
    };
    return Workload;
}());
var Address = /** @class */ (function () {
    function Address(street, number, district, city, cep) {
        this.street = street;
        this.number = number;
        this.district = district;
        this.city = city;
        this.cep = cep;
    }
    return Address;
}());
;
var novaCategoria = new Category('Marceneiro', 'realiza trabalhos com madeira');
var servicoData = new Workload();
console.log(servicoData.formateDate(servicoData.todayte));
console.log(servicoData.deadlineDays(4));
