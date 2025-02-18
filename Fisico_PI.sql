/* Lógico_PI: */

CREATE TABLE Users (
    ID_User INT PRIMARY KEY,
    Name VARCHAR,
    Email VARCHAR,
    Adress VARCHAR,
    CPF VARCHAR,
    Rating INT
);

CREATE TABLE Client (
    fk_Users_ID_User INT PRIMARY KEY
);

CREATE TABLE Service_Provider (
    Region VARCHAR(80),
    Disponibility VARCHAR(80),
    fk_Users_ID_User INT PRIMARY KEY
);

CREATE TABLE Services (
    ID_Service INT PRIMARY KEY,
    Type_Service VARCHAR(80),
    Description VARCHAR(80),
    fk_Service_Provider_fk_Users_ID_User INT
);

CREATE TABLE Feedback (
    Description VARCHAR,
    Picture VARCHAR(80),
    Rating_Service INT,
    ID_Feedback INT PRIMARY KEY,
    fk_Services_ID_Service INT
);

CREATE TABLE Payments (
    ID_Payment INT PRIMARY KEY,
    Method VARCHAR(80)
);

CREATE TABLE Service_Hired_Hires (
    Value FLOAT,
    Issue_Date DATE,
    Complete_Date DATE,
    fk_Payments_ID_Payment INT,
    fk_Services_ID_Service INT,
    fk_Client_fk_Users_ID_User INT
);

CREATE TABLE Messages (
    ID_Message INT PRIMARY KEY,
    Text VARCHAR(80)
);

CREATE TABLE Chat_Send (
    Sending_Time DATE,
    Sending_Date DATE,
    Status VARCHAR(80),
    fk_Users_ID_User INT,
    fk_Messages_ID_Message INT
);
 
ALTER TABLE Client ADD CONSTRAINT FK_Client_2
    FOREIGN KEY (fk_Users_ID_User)
    REFERENCES Users (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Service_Provider ADD CONSTRAINT FK_Service_Provider_2
    FOREIGN KEY (fk_Users_ID_User)
    REFERENCES Users (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Services ADD CONSTRAINT FK_Services_2
    FOREIGN KEY (fk_Service_Provider_fk_Users_ID_User)
    REFERENCES Service_Provider (fk_Users_ID_User)
    ON DELETE RESTRICT;
 
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_2
    FOREIGN KEY (fk_Services_ID_Service)
    REFERENCES Services (ID_Service)
    ON DELETE CASCADE;
 
ALTER TABLE Service_Hired_Hires ADD CONSTRAINT FK_Service_Hired_Hires_1
    FOREIGN KEY (fk_Payments_ID_Payment)
    REFERENCES Payments (ID_Payment)
    ON DELETE RESTRICT;
 
ALTER TABLE Service_Hired_Hires ADD CONSTRAINT FK_Service_Hired_Hires_2
    FOREIGN KEY (fk_Services_ID_Service)
    REFERENCES Services (ID_Service);
 
ALTER TABLE Service_Hired_Hires ADD CONSTRAINT FK_Service_Hired_Hires_3
    FOREIGN KEY (fk_Client_fk_Users_ID_User)
    REFERENCES Client (fk_Users_ID_User);
 
ALTER TABLE Chat_Send ADD CONSTRAINT FK_Chat_Send_1
    FOREIGN KEY (fk_Users_ID_User)
    REFERENCES Users (ID_User);
 
ALTER TABLE Chat_Send ADD CONSTRAINT FK_Chat_Send_2
    FOREIGN KEY (fk_Messages_ID_Message)
    REFERENCES Messages (ID_Message);