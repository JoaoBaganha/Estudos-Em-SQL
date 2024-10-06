-- CREATE Classroom
	CREATE TABLE classroom
		(building		varchar(50),
		 room_number		varchar(7),
		 capacity		numeric(4,0),
		 primary key (building, room_number)
		);

	--Department
		CREATE TABLE department
		(dept_name		varchar(50), 
		 building		varchar(50), 
		 budget		        numeric(12,2) check (budget > 0),
		 primary key (dept_name)
		);
	--Course
		CREATE TABLE course
		(course_id		varchar(8), 
		 title			varchar(50), 
		 dept_name		varchar(50),
		 credits		numeric(2,0) check (credits > 0),
		 primary key (course_id),
		 foreign key (dept_name) references department
			on delete set null
		);
	--instructor
		CREATE TABLE instructor
		(id			varchar(5), 
		 name			varchar(50) not null, 
		 dept_name		varchar(50), 
		 salary			numeric(8,2) check (salary > 29000),
		 primary key (id),
		 foreign key (dept_name) references department
			on delete set null
		);
	--section
		CREATE TABLE section
		(course_id		varchar(8), 
			 sec_id			varchar(8),
		 semester		varchar(10)
			check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
		 year			numeric(4,0) check (year > 1701 and year < 2100), 
		 building		varchar(50),
		 room_number		varchar(7),
		 time_slot_id		varchar(4),
		 primary key (course_id, sec_id, semester, year),
		 foreign key (course_id) references course
			on delete cascade,
		 foreign key (building, room_number) references classroom
			on delete set null
		);
	--teaches
		CREATE TABLE teaches
		(id			varchar(5), 
		 course_id		varchar(8),
		 sec_id			varchar(8), 
		 semester		varchar(10),
		 year			numeric(4,0),
		 primary key (id, course_id, sec_id, semester, year),
		 foreign key (course_id,sec_id, semester, year) references section
			on delete cascade,
		 foreign key (id) references instructor
			on delete cascade
		);
	--student
		CREATE TABLE student
		(id			varchar(5), 
		 name			varchar(50) not null, 
		 dept_name		varchar(50), 
		 tot_cred		numeric(3,0) check (tot_cred >= 0),
		 primary key (id),
		 foreign key (dept_name) references department
			on delete set null
		);
	--takes
		CREATE TABLE takes
		(id			varchar(5), 
		 course_id		varchar(8),
		 sec_id			varchar(8), 
		 semester		varchar(10),
		 year			numeric(4,0),
		 grade		        varchar(2),
		 primary key (id, course_id, sec_id, semester, year),
		 foreign key (course_id,sec_id, semester, year) references section
			on delete cascade,
		 foreign key (id) references student
			on delete cascade
		);
	--advisor
		CREATE TABLE advisor
		(s_id			varchar(5),
		 i_id			varchar(5),
		 primary key (s_id),
		 foreign key (i_id) references instructor (id)
			on delete set null,
		 foreign key (s_id) references student (id)
			on delete cascade
		);
	--time_slot
		CREATE TABLE time_slot
		(time_slot_id		varchar(4),
		 day			varchar(2),
		 start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
		 start_min		numeric(2) check (start_min >= 0 and start_min < 60),
		 end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
		 end_min		numeric(2) check (end_min >= 0 and end_min < 60),
		 primary key (time_slot_id, day, start_hr, start_min)
		);
	--prereq
		CREATE TABLE prereq
		(course_id		varchar(8), 
		 prereq_id		varchar(8),
		 primary key (course_id, prereq_id),
		 foreign key (course_id) references course
			on delete cascade,
		 foreign key (prereq_id) references course
		);
