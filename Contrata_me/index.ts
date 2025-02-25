class User{
   private name:string;
   private birth:Date;
   private address: Address;
   private cnpj_cpf: string;
   private email: string;
    

    constructor(name:string, birth:Date, address:Address, cnpj_cpf:string){
        this.name=name,
        this.birth=birth,
        this.address=address,
        this.cnpj_cpf=cnpj_cpf

    }

    public getName(){
        return this.name
    }

    public setName(newName:string){
        this.name=newName

    }
    public getCnpj_cpf(){
        return this.cnpj_cpf
    }
    public setCnpj_cpf(value: string) {
        this.cnpj_cpf = value;
    }

    public getAddress(){
        return this.address;
    }
    public setAddress(value: Address) {
        this.address = value;
    }
    
    getbirth(){
        return this.birth
    }

    public getEmail(){
        return this.email;
    }
    public setEmail(value: string) {
        this.email = value;
    }

}

class Provider extends User{
    disponibility:boolean; //deve verificar a disponibilidade do provedor de serviço 
    available_service:Array<Service>;

    constructor(name:string,birth:Date,address:Address,cnpj_cpf:string,email:string){
        super(name,birth,address,cnpj_cpf)
    }

    create_service(service:Service, value:number,days:number,description:string){
        service.setPrice(value);
        service.setWorkload(days);
        service.setDescription(description)

    }

}


class Client extends User{ //desenvolver melhor
    service_hired:Array<Service>;

    constructor(name:string,birth:Date,address:Address,cnpj_cpf:string,email:string){
        super(name,birth,address,cnpj_cpf)
    }
    
contracted_service(service:Service){
    this.service_hired.push(service)
    //Gerar lógica para contratação do Provider e não do Service
}

}

class Category{
    description_Category:string;
    name_category:string;

    constructor(name_category:string,description_Category:string){
        this.description_Category=description_Category;
        this.name_category=name_category
    }
}

class Service{
   private type: Category;
   private price: number;
   private description: string;
   private workload: Workload;
   

constructor(type:Category)
    {
    this.type=type;
    
    } 


    public getType(){
        return this.type;
    }
    public setType(value: Category) {
        this.type = value;
    }

    public getPrice(){
        return this.price;
    }
    public setPrice(value: number) {
        this.price = value;
    }

    public getDescription(){
        return this.description;
    }
    public setDescription(value: string) {
        this.description = value;
    }

    public getWorkload(){
        return this.workload.getTodayte();
    }
    public setWorkload(value: number) {
        this.workload.addDays(value)
    }

}

class Workload{
    todayte:Date;


    constructor() {
        this.todayte = new Date();
    }

    getTodayte(){
        return this.todayte
    }

    formateDate(data:Date){
        return data.toLocaleString('pt-BR', {
      weekday: 'short', year: 'numeric', month: 'long', day: 'numeric',
      hour: 'numeric', minute: 'numeric'
    })
    }

    addDays(day:number){
        let newDeadline=new Date();//cria uma var onde salva o a data de hoje
        newDeadline.setDate(newDeadline.getDate()+day)//adiciona o número de dias a partir da data de hoje
        return newDeadline // retorna o novo prazo 
    }

    deadlineDays(day){
        const deadline=this.addDays(day)
        this.todayte=deadline
     return `Prazo de atendimento: ${day} dias`
    }


}


class Address{
    street:string;
    number:number;
    district:string;
    city:string;
    cep:string;

    constructor(street:string,number:number,district:string,city:string,cep:string){
        this.street=street;
        this.number=number;
        this.district=district;
        this.city=city;
        this.cep=cep;
    }
};






let novaCategoria=new Category('Marceneiro','realiza trabalhos com madeira');
let servicoData=new Workload();

console.log(servicoData.formateDate(servicoData.todayte))
console.log(servicoData.deadlineDays(4))
