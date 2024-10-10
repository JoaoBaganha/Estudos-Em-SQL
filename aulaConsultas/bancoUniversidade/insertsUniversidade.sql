-- Inserções para a tabela classroom
INSERT INTO classroom (building, room_number, capacity) VALUES
    ('Doe Hall', '101', 50),
    ('Smith Building', '201', 75),
    ('Engineering Center', '301', 60),
    ('Science Hall', '102', 45),
    ('Arts Building', '202', 55),
    ('Library', '103', 70),
    ('Computer Science Building', '302', 40),
    ('Mathematics Hall', '104', 60),
    ('Business School', '203', 50),
    ('Student Center', '105', 80);

	
	-- Inserções para a tabela department
INSERT INTO department (dept_name, building, budget) VALUES
    ('Computer Science', 'Engineering Center', 100000.00),
    ('Mathematics', 'Mathematics Hall', 80000.00),
    ('Physics', 'Science Hall', 90000.00),
    ('English', 'Arts Building', 75000.00),
    ('History', 'Smith Building', 70000.00),
    ('Business', 'Business School', 120000.00),
    ('Biology', 'Science Hall', 85000.00),
    ('Chemistry', 'Science Hall', 95000.00),
    ('Psychology', 'Doe Hall', 70000.00),
    ('Economics', 'Business School', 110000.00);

	
	-- Inserções para a tabela course
INSERT INTO course (course_id, title, dept_name, credits) VALUES
    ('CS101', 'Introduction to Computer Science', 'Computer Science', 3),
    ('MATH201', 'Calculus I', 'Mathematics', 4),
    ('PHYS101', 'Physics I', 'Physics', 4),
    ('ENGL101', 'English Composition', 'English', 3),
    ('HIST202', 'World History', 'History', 3),
    ('BUS101', 'Introduction to Business', 'Business', 3),
    ('BIOL301', 'Biology for Majors', 'Biology', 4),
    ('CHEM201', 'Chemistry I', 'Chemistry', 4),
    ('PSYCH101', 'Introduction to Psychology', 'Psychology', 3),
    ('ECON301', 'Microeconomics', 'Economics', 3);

	-- Inserções para a tabela instructor
INSERT INTO instructor (id, name, dept_name, salary) VALUES
    ('101', 'John Smith', 'Computer Science', 75000.00),
    ('102', 'Mary Johnson', 'Mathematics', 80000.00),
    ('103', 'Robert Williams', 'Physics', 85000.00),
    ('104', 'Patricia Brown', 'English', 70000.00),
    ('105', 'Michael Jones', 'History', 72000.00),
    ('106', 'Jennifer Davis', 'Business', 95000.00),
    ('107', 'David Wilson', 'Biology', 90000.00),
    ('108', 'Linda Anderson', 'Chemistry', 92000.00),
    ('109', 'William Martin', 'Psychology', 70000.00),
    ('110', 'Susan Garcia', 'Economics', 80000.00);
	
	-- Inserções para a tabela section
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES
    ('CS101', '001', 'Fall', 2023, 'Engineering Center', '301', 'A1'),
    ('MATH201', '002', 'Fall', 2023, 'Mathematics Hall', '104', 'B1'),
    ('PHYS101', '003', 'Fall', 2023, 'Science Hall', '102', 'C1'),
    ('ENGL101', '004', 'Fall', 2023, 'Arts Building', '202', 'D1'),
    ('HIST202', '005', 'Fall', 2023, 'Smith Building', '201', 'E1'),
    ('BUS101', '006', 'Fall', 2023, 'Business School', '203', 'F1'),
    ('BIOL301', '007', 'Fall', 2023, 'Science Hall', '102', 'G1'),
    ('CHEM201', '008', 'Fall', 2023, 'Science Hall', '102', 'H1'),
    ('PSYCH101', '009', 'Fall', 2023, 'Doe Hall', '101', 'I1'),
    ('ECON301', '010', 'Fall', 2023, 'Business School', '203', 'J1');

	-- Inserções para a tabela teaches
INSERT INTO teaches (id, course_id, sec_id, semester, year) VALUES
    ('101', 'CS101', '001', 'Fall', 2023),
    ('102', 'MATH201', '002', 'Fall', 2023),
    ('103', 'PHYS101', '003', 'Fall', 2023),
    ('104', 'ENGL101', '004', 'Fall', 2023),
    ('105', 'HIST202', '005', 'Fall', 2023),
    ('106', 'BUS101', '006', 'Fall', 2023),
    ('107', 'BIOL301', '007', 'Fall', 2023),
    ('108', 'CHEM201', '008', 'Fall', 2023),
    ('109', 'PSYCH101', '009', 'Fall', 2023),
    ('110', 'ECON301', '010', 'Fall', 2023);

	-- Inserções para a tabela student
INSERT INTO student (id, name, dept_name, tot_cred) VALUES
    ('S101', 'Alice Johnson', 'Computer Science', 45),
    ('S102', 'Bob Smith', 'Mathematics', 30),
    ('S103', 'Charlie Brown', 'Physics', 36),
    ('S104', 'David Davis', 'English', 27),
    ('S105', 'Eva Wilson', 'History', 33),
    ('S106', 'Frank Martin', 'Business', 48),
    ('S107', 'Grace Anderson', 'Biology', 39),
    ('S108', 'Hannah Garcia', 'Chemistry', 42),
    ('S109', 'Isaac Wilson', 'Psychology', 31),
    ('S110', 'Jessica Davis', 'Economics', 30);

	-- Inserções para a tabela takes
INSERT INTO takes (id, course_id, sec_id, semester, year, grade) VALUES
    ('S101', 'CS101', '001', 'Fall', 2023, 'A'),
    ('S102', 'MATH201', '002', 'Fall', 2023, 'B+'),
    ('S103', 'PHYS101', '003', 'Fall', 2023, 'A-'),
    ('S104', 'ENGL101', '004', 'Fall', 2023, 'B'),
    ('S105', 'HIST202', '005', 'Fall', 2023, 'A'),
    ('S106', 'BUS101', '006', 'Fall', 2023, 'A+'),
    ('S107', 'BIOL301', '007', 'Fall', 2023, 'B'),
    ('S108', 'CHEM201', '008', 'Fall', 2023, 'A-'),
    ('S109', 'PSYCH101', '009', 'Fall', 2023, 'C'),
    ('S110', 'ECON301', '010', 'Fall', 2023, 'B+');


	-- Inserções para a tabela advisor
INSERT INTO advisor (s_id, i_id) VALUES
    ('S101', '101'),
    ('S102', '102'),
    ('S103', '103'),
    ('S104', '104'),
    ('S105', '105'),
    ('S106', '106'),
    ('S107', '107'),
    ('S108', '108'),
    ('S109', '109'),
    ('S110', '110');

	-- Inserções para a tabela time_slot
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES
    ('A1', 'M', 8, 0, 9, 30),
    ('B1', 'T', 10, 0, 11, 30),
    ('C1', 'W', 12, 0, 13, 30),
    ('D1', 'Th', 14, 0, 15, 30),
    ('E1', 'F', 16, 0, 17, 30),
    ('F1', 'M', 8, 0, 9, 30),
    ('G1', 'T', 10, 0, 11, 30),
    ('H1', 'W', 12, 0, 13, 30),
    ('I1', 'Th', 14, 0, 15, 30),
    ('J1', 'F', 16, 0, 17, 30);

-- Inserções adicionais para a tabela course
INSERT INTO course (course_id, title, dept_name, credits) VALUES
    ('CS102', 'Data Structures', 'Computer Science', 3),
    ('MATH202', 'Calculus II', 'Mathematics', 4),
    ('PHYS102', 'Physics II', 'Physics', 4),
    ('ENGL102', 'Advanced Composition', 'English', 3),
    ('HIST203', 'Modern History', 'History', 3),
    ('BUS102', 'Business Ethics', 'Business', 3),
    ('BIOL302', 'Genetics', 'Biology', 4),
    ('CHEM202', 'Organic Chemistry', 'Chemistry', 4),
    ('PSYCH102', 'Developmental Psychology', 'Psychology', 3),
    ('ECON302', 'Macroeconomics', 'Economics', 3);

-- Inserções adicionais para a tabela section
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES
    ('CS102', '001', 'Fall', 2023, 'Engineering Center', '301', 'A1'),
    ('MATH202', '002', 'Fall', 2023, 'Mathematics Hall', '104', 'B1'),
    ('PHYS102', '003', 'Fall', 2023, 'Science Hall', '102', 'C1'),
    ('ENGL102', '004', 'Fall', 2023, 'Arts Building', '202', 'D1'),
    ('HIST203', '005', 'Fall', 2023, 'Smith Building', '201', 'E1'),
    ('BUS102', '006', 'Fall', 2023, 'Business School', '203', 'F1'),
    ('BIOL302', '007', 'Fall', 2023, 'Science Hall', '102', 'G1'),
    ('CHEM202', '008', 'Fall', 2023, 'Science Hall', '102', 'H1'),
    ('PSYCH102', '009', 'Fall', 2023, 'Doe Hall', '101', 'I1'),
    ('ECON302', '010', 'Fall', 2023, 'Business School', '203', 'J1');

-- Inserções adicionais para a tabela teaches
INSERT INTO teaches (id, course_id, sec_id, semester, year) VALUES
    ('101', 'CS102', '001', 'Fall', 2023),
    ('102', 'MATH202', '002', 'Fall', 2023),
    ('103', 'PHYS102', '003', 'Fall', 2023),
    ('104', 'ENGL102', '004', 'Fall', 2023),
    ('105', 'HIST203', '005', 'Fall', 2023),
    ('106', 'BUS102', '006', 'Fall', 2023),
    ('107', 'BIOL302', '007', 'Fall', 2023),
    ('108', 'CHEM202', '008', 'Fall', 2023),
    ('109', 'PSYCH102', '009', 'Fall', 2023),
    ('110', 'ECON302', '010', 'Fall', 2023);
