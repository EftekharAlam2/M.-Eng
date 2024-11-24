-- Table: Book
CREATE TABLE Book (
    BookId VARCHAR2(14) PRIMARY KEY,
    Title VARCHAR2(50),
    PublisherName VARCHAR2(20)
);

-- Table: Book_Author
CREATE TABLE Book_Author (
    BookId VARCHAR2(14),
    AuthorName VARCHAR2(50),
    PRIMARY KEY (BookId, AuthorName)
);

-- Table: Publisher
CREATE TABLE Publisher (
    Name VARCHAR2(20) PRIMARY KEY,
    Address VARCHAR2(50),
    Phone VARCHAR2(15)
);

-- Table: Book_Copies
CREATE TABLE Book_Copies (
    BookId VARCHAR2(14),
    BranchId NUMBER,
    No_Of_Copies NUMBER,
    PRIMARY KEY (BookId, BranchId)
);

-- Table: Library_Branch
CREATE TABLE Library_Branch (
    BranchId NUMBER PRIMARY KEY,
    BranchName VARCHAR2(50),
    Address VARCHAR2(50)
);

-- Table: Borrower
CREATE TABLE Borrower (
    CardNo NUMBER PRIMARY KEY,
    Name VARCHAR2(20),
    Address VARCHAR2(50),
    Phone VARCHAR2(15)
);

-- Table: Book_Loan
CREATE TABLE Book_Loan (
    BookId VARCHAR2(14),
    BranchId NUMBER,
    CardNo NUMBER,
    DateOut DATE,
    DueDate DATE,
    PRIMARY KEY (BookId, BranchId, CardNo)
);

-- Insert data into Book table
INSERT ALL
    INTO Book (BookId, Title, PublisherName) VALUES ('100.00.01cn', 'Computer Network', 'PHI')
    INTO Book (BookId, Title, PublisherName) VALUES ('100.00.02dsc', 'Database System', 'Tata')
    INTO Book (BookId, Title, PublisherName) VALUES ('100.00.03ds', 'Digital System', 'Tata')
    INTO Book (BookId, Title, PublisherName) VALUES ('100.00.04db', 'DBMS', 'PHI')
    INTO Book (BookId, Title, PublisherName) VALUES ('100.00.05ora', 'Oracle 2000', 'Galgotia')
SELECT * FROM dual;

-- Insert data into Book_Author table
INSERT ALL
    INTO Book_Author (BookId, AuthorName) VALUES ('100.00.01cn', 'A S Tanenbaum')
    INTO Book_Author (BookId, AuthorName) VALUES ('100.00.02dsc', 'Silberschatz')
    INTO Book_Author (BookId, AuthorName) VALUES ('100.00.03ds', 'Ronald J Tocci')
    INTO Book_Author (BookId, AuthorName) VALUES ('100.00.04db', 'Ivan Bayross')
    INTO Book_Author (BookId, AuthorName) VALUES ('100.00.05ora', 'Ivan Bayross')
SELECT * FROM dual;


-- Insert data into Publisher table
INSERT ALL
    INTO Publisher (Name, Address, Phone) VALUES ('PHI', '20 Delhi Super Market', '01715-454678')
    INTO Publisher (Name, Address, Phone) VALUES ('Tata', 'North Kolkata', '0156-2345445')
    INTO Publisher (Name, Address, Phone) VALUES ('Galgotia', 'Mumbai', '0192-203490')
SELECT * FROM dual;

-- Insert data into Book_Copies table
INSERT ALL
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.01cn', 1001, 2)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.01cn', 1002, 5)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.02dsc', 1001, 3)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.02dsc', 1002, 4)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.03ds', 1001, 3)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.03ds', 1003, 5)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.04db', 1001, 2)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.04db', 1002, 5)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.05ora', 1001, 2)
    INTO Book_Copies (BookId, BranchId, No_Of_Copies) VALUES ('100.00.05ora', 1002, 7)
SELECT * FROM dual;

-- Insert data into Library_Branch table
INSERT ALL
    INTO Library_Branch (BranchId, BranchName, Address) VALUES (1001, 'CSE Seminar Library', 'Rajshahi')
    INTO Library_Branch (BranchId, BranchName, Address) VALUES (1002, 'RU Central Library', 'Rajshahi')
    INTO Library_Branch (BranchId, BranchName, Address) VALUES (1003, 'DU Central Library', 'Dhaka')
SELECT * FROM dual;

-- Insert data into Borrower table
INSERT ALL
    INTO Borrower (CardNo, Name, Address, Phone) VALUES (10001, 'Saidur', 'CSE', '01714-400567')
    INTO Borrower (CardNo, Name, Address, Phone) VALUES (10002, 'Rafiq', 'PHYSICS', '0194-300456')
    INTO Borrower (CardNo, Name, Address, Phone) VALUES (10003, 'Masud', 'CSE', '0156-345678')
    INTO Borrower (CardNo, Name, Address, Phone) VALUES (10004, 'Nobir', 'ICT', '01199-203456')
SELECT * FROM dual;

-- Insert data into Book_Loan table
INSERT ALL
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.01cn', 1001, 10001, TO_DATE('15-Jan-15', 'DD-Mon-YY'), TO_DATE('15-Feb-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.02ds', 1002, 10002, TO_DATE('23-Jan-15', 'DD-Mon-YY'), TO_DATE('23-Feb-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.03fs', 1001, 10003, TO_DATE('27-Jan-15', 'DD-Mon-YY'), TO_DATE('27-Feb-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.04bg', 1003, 10001, TO_DATE('15-Feb-15', 'DD-Mon-YY'), TO_DATE('15-Mar-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.05ora', 1002, 10004, TO_DATE('20-Feb-15', 'DD-Mon-YY'), TO_DATE('20-Mar-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.03fs', 1001, 10002, TO_DATE('14-Nov-15', 'DD-Mon-YY'), TO_DATE('14-Dec-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.05ora', 1001, 10003, TO_DATE('15-Nov-15', 'DD-Mon-YY'), TO_DATE('15-Dec-15', 'DD-Mon-YY'))
    INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate) VALUES ('100.00.01cn', 1002, 10003, TO_DATE('23-Dec-15', 'DD-Mon-YY'), TO_DATE('23-Jan-16', 'DD-Mon-YY'))
SELECT * FROM dual;


--1
SELECT SUM(bc.No_Of_Copies) AS Total_Copies
FROM Book b
JOIN Book_Copies bc ON b.BookId = bc.BookId
JOIN Library_Branch lb ON bc.BranchId = lb.BranchId
WHERE b.Title = 'DBMS' AND lb.BranchName = 'CSE Seminar Library';


--2
SELECT lb.BranchName, SUM(bc.No_Of_Copies) AS Total_Copies
FROM Book b
JOIN Book_Copies bc ON b.BookId = bc.BookId
JOIN Library_Branch lb ON bc.BranchId = lb.BranchId
WHERE b.Title = 'DBMS'
GROUP BY lb.BranchName;


--3
SELECT b.Name
FROM Borrower b
LEFT JOIN BOOK_LOAN bl ON b.CardNo = bl.CardNo
WHERE bl.BookId IS NULL;


--4
SELECT b.Title, br.Name, br.Address
FROM Book_Loan bl
JOIN Book b ON bl.BookId = b.BookId
JOIN Borrower br ON bl.CardNo = br.CardNo
JOIN Library_Branch lb ON bl.BranchId = lb.BranchId
WHERE lb.BranchName = 'CSE Seminar Library' AND bl.DueDate = SYSDATE;


--5
SELECT lb.BranchName, COUNT(bl.BookId) AS Total_Loans
FROM Library_Branch lb
JOIN Book_Loan bl ON lb.BranchId = bl.BranchId
GROUP BY lb.BranchName;


--6
SELECT br.Name, br.Address, COUNT(bl.BookId) AS Books_Checked_Out
FROM Borrower br
JOIN Book_Loan bl ON br.CardNo = bl.CardNo
GROUP BY br.Name, br.Address
HAVING COUNT(bl.BookId) > 2;


--7
SELECT b.Title, bc.No_Of_Copies
FROM Book_Author ba
JOIN Book b ON ba.BookId = b.BookId
JOIN Book_Copies bc ON b.BookId = bc.BookId
JOIN Library_Branch lb ON bc.BranchId = lb.BranchId
WHERE ba.AuthorName = 'Ivan Bayross' AND lb.BranchName = 'RU Central Library';
