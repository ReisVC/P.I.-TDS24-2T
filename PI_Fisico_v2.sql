/* PI_Logico_v2: */

CREATE TABLE Users (
    ID_User INT PRIMARY KEY,
    Name VARCHAR(80),
    Email VARCHAR(80),
    CPF VARCHAR(11),
    Rating INT,
    fk_Address_ID_Address INT
);

CREATE TABLE Client (
    fk_Users_ID_User INT PRIMARY KEY
);

CREATE TABLE Service_Provider (
    Region VARCHAR(80),
    Disponibility BOOLEAN,
    fk_Users_ID_User INT PRIMARY KEY
);

CREATE TABLE Services (
    ID_Service INT PRIMARY KEY,
    Type_Service VARCHAR(80),
    Description VARCHAR(80),
    fk_Service_Provider_fk_Users_ID_User INT,
    fk_Feedback_ID_Feedback INT,
    fk_Category_Service_ID_Category INT
);

CREATE TABLE Feedback (
    Description VARCHAR(80),
    Picture VARCHAR(80),
    Rating_Service INT,
    ID_Feedback INT PRIMARY KEY
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

CREATE TABLE Address (
    ID_Address INT PRIMARY KEY,
    Street VARCHAR(80),
    District VARCHAR(80),
    City VARCHAR(80),
    Num INT,
    Cep VARCHAR(8)
);

CREATE TABLE Category_Service (
    ID_Category INT PRIMARY KEY,
    Name_Category VARCHAR(80),
    Description_Category VARCHAR(80)
);
 
ALTER TABLE Users ADD CONSTRAINT FK_Users_2
    FOREIGN KEY (fk_Address_ID_Address)
    REFERENCES Address (ID_Address)
    ON DELETE RESTRICT;
 
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
 
ALTER TABLE Services ADD CONSTRAINT FK_Services_3
    FOREIGN KEY (fk_Feedback_ID_Feedback)
    REFERENCES Feedback (ID_Feedback)
    ON DELETE RESTRICT;
 
ALTER TABLE Services ADD CONSTRAINT FK_Services_4
    FOREIGN KEY (fk_Category_Service_ID_Category)
    REFERENCES Category_Service (ID_Category)
    ON DELETE RESTRICT;
 
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