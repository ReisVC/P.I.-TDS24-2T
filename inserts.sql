SELECT * FROM address;

INSERT INTO users(id_user, name, email, cpf, rating, fk_address_id_address)
VALUES(1, 'Vitor Reis', 'vitor@gmail.com', '11122233344', 5, 1)

insert into address (id_address, street, district, city, num,cep)
VALUES(1,'Brasil', 'Feitoria', 'São Leopoldo', 69, '93140249')

select * from category_service

insert into category_service (id_category,name_category, description_category)
values(1, 'Alvenaria', 'Lida com serviços envolvendo concreto, tijolos e cimento')

select * from chat_send

insert into chat_send(sending_time, sending_date, status, fk_users_id_user,fk_messages_id_message)
values('2025-02-24 15:30:00','2025-02-24', 'Enviado',1,1)

select * from messages

insert into messages (id_message, text)
values(1, 'to com problemas, muito graves, é coisa de ajudante de casa')

select * from client

insert into client (fk_users_id_user)
values(1)

select * from feedback

insert into feedback(description, picture,rating_service, id_feedback)
values('Gostei do trabalho, muito bonito o atendente','caminho da imagem aqui', 10,1)

select * from payments

insert into payments(id_payment, method)
values(1,'piques')

select * from service_hired_hires

insert into service_hired_hires(value, issue_date, complete_date, fk_payments_id_payment, fk_services_id_service,fk_client_fk_users_id_user)
values(3000,'2025-02-24', '2025-03-01',1,1,1)

select * from service_provider

insert into service_provider(region,disponibility,fk_users_id_user)
values('São Leopoldo', true,1)

select * from services

insert into services(id_service,type_service,description, fk_service_provider_fk_users_id_user, fk_feedback_id_feedback, fk_category_service_id_category)
values(1,'Manual','Construção de muro por m²',1,1,1)

SELECT * FROM users
INNER JOIN client
ON users.id_user = client.fk_users_id_user

SELECT * FROM messages ME
INNER JOIN chat_send CS
ON CS.fk_messages_id_message = ME.id_message

SELECT name, city FROM address AD
INNER JOIN users
ON AD.id_address = users.fk_address_id_address