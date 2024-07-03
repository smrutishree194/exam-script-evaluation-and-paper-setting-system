CREATE TABLE IF NOT EXISTS paper_setter (
    setter_id INT AUTO_INCREMENT PRIMARY KEY,
    title ENUM('Mr.', 'Mrs.', 'Ms.', 'Dr.', 'Prof.') NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    designation ENUM('Professor', 'Associate Professor', 'Assistant Professor') NOT NULL,
    mobile_no CHAR(10) NOT NULL,
    organization VARCHAR(255) NOT NULL
);
