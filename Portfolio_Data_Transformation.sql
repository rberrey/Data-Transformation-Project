/*
--FILE OVERVIEW:

In this project, I'll be creating a mock source and target schema, and simulating the transfer of transformed data
from source tables to target tables.

My source schema will be my "original" data that I will be transforming.
My source schema will have two tables - patients and encounters.
After creating the source schema, I will then create a target schema to load my transformed data into.

DISCLAIMER: this data set does not contain real patient information - all patient and encounter info was generated using Chat GPT!

*/

--Creating Source Schema
DROP SCHEMA IF EXISTS source;
CREATE SCHEMA source;


--Creating source.patients table
CREATE TABLE source.patients (
	patient_id		SERIAL,
	name			TEXT,
	gender			TEXT NOT NULL,
	race			TEXT,
	birthday		DATE,
	street			TEXT,
	city			TEXT,
	state			TEXT,
	zip			INTEGER,
	CONSTRAINT patients_pk PRIMARY KEY (patient_id)
);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('John Doe', 'male', 'W', '1980-01-01', '65403 First Avenue', 'Greenville', 'North Carolina', 27833);	
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jackson Smith', 'male', 'B', '1985-06-15', '65894 Second Street', 'Winterville', 'North Carolina', 28590);	
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Dianne Williams', 'female', 'A', '1976-12-31', '123 Third Drive', 'Greenville', 'South Carolina', 29601);	
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('George Hill', 'male', 'H', '1998-07-21', '837 Eric Lake', 'North Melissa', 'South Carolina', 29141);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Devin Williams', 'male', 'O', '1997-01-11', '855 Joseph Land Apt. 754', 'Deckerside', 'North Carolina', 27870);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Scott Ruiz', 'female', 'O', '1991-08-13', '669 Sara Street', 'Thomasville', 'Virginia', 22725);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Scott Myers', 'male', 'B', '1986-06-28', '214 Stevens Summit Suite 976', 'South Rebeccaville', 'South Carolina', 29178);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Gina Pope', 'female', 'A', '1998-03-20', '8413 Ricky Common Apt. 405', 'Wattsfort', 'South Carolina', 29042);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('David Mack', 'male', 'A', '1997-07-15', '0056 Lonnie Manor', 'New Eric', 'South Carolina', 29610);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Brittany Reyes', 'male', 'A', '1958-04-08', '7447 Jenna Harbors Suite 185', 'Millerside', 'North Carolina', 28286);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Trevor Bennett', 'female', 'A', '1975-08-14', '857 Mckenzie Pass Suite 651', 'South Toddshire', 'North Carolina', 27967);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jennifer Burgess', 'male', 'W', '1952-10-14', '892 Shane Rue Apt. 810', 'East Timothychester', 'South Carolina', 29376);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Wesley Hernandez', 'male', 'A', '1976-08-20', '0872 Sanchez Pike Apt. 645', 'East Jimmyberg', 'South Carolina', 29691);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Holly Collins', 'female', 'A', '1961-07-30', '709 Williams Stravenue', 'Brewerberg', 'North Carolina', 28153);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('William Hardy', 'female', 'O', '1987-03-08', '49551 William Plaza', 'Millertown', 'North Carolina', 28178);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Kimberly Sanford', 'female', 'B', '2000-02-09', '39667 Ramirez Mountain Suite 774', 'Smithbury', 'North Carolina', 27567);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Kendra Martin', 'female', 'W', '1982-01-11', '4456 Edwards Course', 'Lake Matthewton', 'Virginia', 22594);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Sabrina Carter', 'female', 'A', '1965-06-19', '4366 Meyer Park', 'Brianchester', 'Virginia', 22557);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Sean Davis', 'male', 'W', '1965-04-05', '684 Jones Rue', 'Lake Laurentown', 'Virginia', 24047);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('David Krause Jr.', 'male', 'O', '1984-05-14', '2126 Horn River', 'Kathleenfort', 'Virginia', 23037);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Victor Hoffman', 'female', 'H', '1968-06-01', '6053 Dean Summit Apt. 649', 'Lake Mollymouth', 'Virginia', 23252);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jason Flynn II', 'female', 'A', '1998-07-07', '2033 Eddie Parkway Apt. 888', 'Kevinside', 'South Carolina', 29340);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jane Hendricks', 'male', 'H', '1962-12-02', '6144 Dean Island Apt. 461', 'New Jonathan', 'South Carolina', 29924);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Melissa Craig', 'male', 'O', '1993-01-14', '2714 Daniel Fork', 'Port Reginaburgh', 'South Carolina', 29601);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jodi Weaver', 'female', 'B', '1997-11-27', '7867 Gutierrez Walks', 'Bentleyberg', 'South Carolina', 29785);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('John Freeman', 'female', 'W', '1967-12-09', '42153 Salinas Mountain Suite 329', 'Andreashire', 'Virginia', 23359);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Evelyn Parker', 'female', 'H', '1997-11-30', '9165 Williams Ridges', 'Charlesside', 'Virginia', 23958);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Angela Lopez', 'male', 'H', '1957-08-16', '918 Smith Motorway Apt. 801', 'Lindaton', 'North Carolina', 27930);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Stephanie Weber', 'male', 'H', '1955-08-08', '4453 Mary Valleys Apt. 096', 'West Michelleside', 'South Carolina', 29401);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jennifer Williams', 'male', 'A', '1956-05-10', '5568 Elizabeth Overpass Apt. 332', 'South Melissaville', 'North Carolina', 27333);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jason Cole', 'female', 'H', '1998-07-05', '8041 Tiffany Drive', 'Sandraside', 'South Carolina', 29094);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Charles Powell', 'male', 'A', '1990-04-03', '554 Crystal Shores Apt. 104', 'South Matthew', 'Virginia', 23079);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Matthew Leonard', 'male', 'A', '1986-06-19', '102 Romero Mall', 'Patrickberg', 'North Carolina', 28201);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Molly Mcguire', 'female', 'H', '1967-03-25', '527 Hunt Flats', 'West Christopher', 'South Carolina', 29289);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Dennis Kerr', 'male', 'W', '1984-09-20', '877 Jackson Street Apt. 809', 'Pinedafurt', 'North Carolina', 28568);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Miranda Lee', 'female', 'A', '1966-11-04', '403 Anderson Plain', 'New Ashleeborough', 'North Carolina', 27687);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Miguel Arnold MD', 'male', 'O', '1974-02-06', '481 Smith Canyon Apt. 013', 'East Jonathanshire', 'South Carolina', 29115);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Brandon Snyder', 'male', 'O', '1978-06-15', '021 Wolf Manors', 'Davidsonchester', 'South Carolina', 29627);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Joshua Gordon', 'male', 'W', '1960-10-31', '24672 Mary Extension Suite 594', 'Martinbury', 'South Carolina', 29730);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Xavier Coleman', 'female', 'O', '1985-04-11', '343 Marsh Center', 'Codyberg', 'North Carolina', 27578);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Kathryn Skinner', 'female', 'B', '1983-07-16', '317 Timothy Causeway', 'Matthewville', 'North Carolina', 27494);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('John Rogers', 'female', 'B', '1967-10-20', '20868 Smith Hill', 'Lake Thomas', 'North Carolina', 28752);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Julia Avila', 'male', 'W', '1984-12-25', '109 William Road Suite 348', 'North Garyborough', 'South Carolina', 29476);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Kimberly Cruz', 'female', 'O', '2000-03-16', '7362 Andrew Junctions', 'New Crystalport', 'South Carolina', 29666);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Barbara Mercer', 'female', 'O', '1951-09-30', '940 Torres Corner', 'West Tommy', 'Virginia', 22971);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Katherine Middleton', 'male', 'A', '1955-06-13', '516 Dylan Cliff Suite 345', 'Smithside', 'Virginia', 22055);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Shannon Floyd', 'female', 'A', '2000-07-22', '90545 Selena Shoals', 'North Jessica', 'Virginia', 23953);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Anne Vaughn', 'male', 'H', '1957-09-29', '685 Joshua Circles', 'Shannonstad', 'Virginia', 23650);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('John Davis', 'male', 'A', '1969-05-26', '9176 Denise Estates', 'Carmenborough', 'South Carolina', 29706);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Erica Green', 'female', 'H', '1981-05-22', '97714 Weiss Forge', 'Lake Steven', 'South Carolina', 29211);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Veronica Fritz', 'male', 'W', '1988-11-21', '69339 Penny Estate Suite 939', 'Meganfurt', 'North Carolina', 28355);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jason Allen', 'female', 'A', '1974-04-24', '575 Carol Oval', 'Gatesfort', 'Virginia', 22506);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Cesar Cabrera', 'female', 'H', '1995-10-23', '8818 Dennis Drives Apt. 529', 'North Carrie', 'South Carolina', 29588);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Tina Williams', 'male', 'H', '1990-11-02', '27146 Jonathan Pines Apt. 502', 'Cisnerosmouth', 'Virginia', 24342);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Brian Cox', 'female', 'W', '1996-08-07', '25109 Stephanie Freeway Suite 322', 'South Michaelborough', 'Virginia', 23897);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Megan Lee DDS', 'male', 'A', '1975-04-17', '9082 Cross Views', 'West Ericchester', 'Virginia', 22206);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Deborah Cruz', 'male', 'H', '1993-07-11', '7786 Antonio Corners Suite 210', 'Alexandriamouth', 'South Carolina', 29309);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Natalie Cordova', 'male', 'A', '1987-01-26', '6876 Richard Squares Suite 960', 'North Shelleyton', 'Virginia', 23129);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Joseph Smith', 'male', 'B', '1996-02-07', '688 Mcclure Plains Suite 047', 'Rogersmouth', 'Virginia', 23357);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Tiffany Simmons', 'female', 'A', '1978-08-28', '97363 Holland Brook', 'Richmondmouth', 'North Carolina', 28036);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Nathan Manning', 'female', 'A', '1976-11-24', '15822 Meyer Orchard', 'Amandachester', 'North Carolina', 28828);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Carrie Taylor', 'female', 'O', '1967-02-19', '09714 Patterson Keys Suite 551', 'Taylortown', 'South Carolina', 29672);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Tina Gilbert', 'female', 'B', '1961-09-07', '207 Tommy Plaza', 'North Michaelfurt', 'North Carolina', 27881);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Anthony Joyce', 'male', 'H', '1954-04-28', '994 Williams Prairie', 'Michelletown', 'North Carolina', 27828);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Charles Adams', 'female', 'W', '1952-03-16', '175 Castro Shores', 'Bryantburgh', 'South Carolina', 29275);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jacob Glass', 'male', 'H', '1978-09-16', '653 Krause Manor', 'Rodriguezmouth', 'South Carolina', 29844);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Charles Rodriguez', 'male', 'A', '1974-01-26', '44763 Murray Lodge', 'Lake Erinmouth', 'South Carolina', 29404);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Kayla Ramos', 'male', 'H', '1950-09-18', '8322 Cruz Terrace Suite 584', 'South Martha', 'North Carolina', 28827);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Crystal Gross', 'male', 'H', '1985-12-05', '32107 Lowe Groves Apt. 477', 'Lake Michealberg', 'Virginia', 23217);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Frank Smith', 'male', 'W', '1961-12-19', '3925 Edwards Rapid Apt. 446', 'Kinghaven', 'South Carolina', 29299);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Robert Thomas', 'female', 'A', '1959-12-21', '876 Gonzalez River', 'Tyroneshire', 'South Carolina', 29077);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Sean Jones', 'female', 'A', '1967-08-14', '878 Tracy Loaf', 'West Stephen', 'South Carolina', 29838);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jody Dawson', 'female', 'A', '1975-10-31', '61026 Carol Junction', 'Williamsport', 'North Carolina', 28043);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jorge Farmer', 'female', 'B', '1965-01-06', '1438 Johnson Springs Suite 861', 'Kimberlyton', 'South Carolina', 29258);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Thomas Walker', 'male', 'A', '1956-07-04', '0894 Stephanie Common Apt. 329', 'East Cheryl', 'North Carolina', 28426);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jill Olson', 'male', 'W', '1968-12-09', '5464 Cooley Mews', 'Robinburgh', 'Virginia', 22963);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jason Smith', 'male', 'A', '1972-09-30', '7396 David Junction', 'Bartonfurt', 'South Carolina', 29252);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Joseph Holder', 'male', 'O', '1957-07-05', '843 Frazier View', 'West Janet', 'North Carolina', 27606);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Haley Garner', 'female', 'H', '1965-08-10', '0367 Ryan Court Apt. 263', 'Amymouth', 'South Carolina', 29082);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Ronald Harris', 'male', 'A', '1985-06-17', '442 Samantha Land Suite 912', 'Katieshire', 'South Carolina', 29817);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Susan Smith', 'female', 'B', '1967-01-26', '8623 Smith Mountains', 'Josephshire', 'North Carolina', 27598);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Terri Bass', 'male', 'H', '1970-11-01', '767 Gaines Ways', 'New Petershire', 'North Carolina', 28428);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Carol Johnson', 'female', 'A', '1956-10-29', '2148 Robin Square Suite 171', 'Port Kyle', 'South Carolina', 29012);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Stephanie Ford', 'male', 'B', '1996-08-23', '267 Torres Curve', 'South Nicoleton', 'South Carolina', 29009);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Joseph Higgins', 'female', 'A', '1969-06-28', '086 John View', 'South Jenniferchester', 'North Carolina', 27705);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Douglas Campbell', 'male', 'A', '1969-12-06', '6517 Davis Spring Suite 312', 'Krystaltown', 'North Carolina', 27791);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Leslie Allen', 'female', 'W', '1993-03-22', '030 Howard Glens Apt. 383', 'Port Danielleside', 'South Carolina', 29322);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Johnathan Weber', 'male', 'W', '1995-03-11', '095 Adams Locks Apt. 624', 'West Jenniferstad', 'South Carolina', 29230);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Tyler Ramirez', 'female', 'B', '1997-04-18', '99893 Moon Lights Apt. 217', 'Westville', 'Virginia', 22066);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Sharon Carroll', 'male', 'A', '1997-09-25', '700 Contreras Freeway', 'Ralphstad', 'South Carolina', 29270);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Vincent Nelson', 'female', 'B', '1996-06-19', '820 Fischer Curve', 'New Hannah', 'South Carolina', 29486);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Paul Lowery', 'female', 'W', '1987-09-16', '27840 Lee Lock Suite 540', 'Port Cherylfurt', 'North Carolina', 27369);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Courtney Lindsey', 'female', 'W', '1954-07-14', '99633 Osborne Mills Suite 035', 'Baileybury', 'Virginia', 24477);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jennifer Landry', 'male', 'O', '1993-02-28', '74701 Colleen Ville Apt. 476', 'Lake Williamview', 'South Carolina', 29939);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Debbie Ferguson', 'male', 'W', '1950-01-27', '590 Hines Spur', 'North John', 'Virginia', 22258);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Victor Cunningham', 'female', 'B', '1988-07-11', '681 Cox Mountains', 'Rebeccashire', 'South Carolina', 29162);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Stacey Oliver', 'female', 'A', '1989-09-07', '5728 Linda Forks', 'New Mary', 'South Carolina', 29875);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Jennifer Brown', 'male', 'B', '1973-10-03', '355 Darlene Ford', 'Hughesberg', 'Virginia', 22472);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Joseph White', 'male', 'O', '1956-06-30', '024 Smith Views', 'Lake Laurenville', 'South Carolina', 29722);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('William Murphy', 'female', 'B', '1992-05-19', '335 Aguilar Expressway', 'Collinschester', 'North Carolina', 28863);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Mathew Wu', 'male', 'B', '1961-11-17', '603 Pope Throughway', 'South Samanthaburgh', 'North Carolina', 28611);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Ann Wilson', 'female', 'H', '1970-01-27', '936 Michael Passage', 'Johnview', 'Virginia', 22465);
INSERT INTO source.patients (name, gender, race, birthday, street, city, state, zip) VALUES ('Michelle Turner', 'male', 'H', '1970-02-02', '009 Janice Drives', 'Theresastad', 'North Carolina', 28480);

--Creating source.encounters table
CREATE TABLE source.encounters(
	encounter_id		SERIAL,
	patient_id		INTEGER,
	admit_date		DATE,
	department_name		TEXT,
	age			INTEGER,	-- in years
	weight			INTEGER,	-- in pounds
	CONSTRAINT encounters_pk PRIMARY KEY (encounter_id),
	CONSTRAINT encounters_patients_fk FOREIGN KEY (patient_id) REFERENCES source.patients (patient_id),
	CONSTRAINT encounter_age_ck CHECK(age BETWEEN 0 AND 120)
);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (1, '2012-02-11', 'clinic_1', 32, 130);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (2, '2012-03-09', 'emergency', 27, 197);	
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (1, '2013-09-16', 'oncology', 33, 145);	
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (2, '2013-09-16', 'clinic_2', 28, 215);	
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (1, '2013-09-21', 'radiology', 33, 142);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (3, '2013-09-26', 'clinic_1', 37, 165);	
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (3, '2013-09-27', 'emergency', 37, 164);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (43, '2020-04-15', 'clinic_2', 21, 299);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (20, '2014-02-07', 'clinic_1', 35, 286);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (24, '2015-11-05', 'clinic_2', 77, 196);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (58, '2023-03-05', 'emergency', 28, 233);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (57, '2023-04-07', 'clinic_1', 0, 273);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (29, '2016-06-16', 'oncology', 90, 127);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (59, '2023-10-11', 'oncology', 116, 295);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (92, '2021-03-13', 'clinic_1', 109, 162);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (59, '2018-11-26', 'clinic_1', 45, 178);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (9, '2017-10-27', 'clinic_2', 53, 107);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (94, '2015-08-04', 'clinic_2', 49, 285);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (5, '2020-11-19', 'clinic_2', 76, 266);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (15, '2017-05-24', 'oncology', 96, 250);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (38, '2017-06-13', 'oncology', 26, 271);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (50, '2017-01-29', 'oncology', 108, 201);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (96, '2015-11-16', 'clinic_2', 96, 186);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (23, '2013-12-27', 'emergency', 97, 171);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (60, '2021-05-18', 'emergency', 26, 267);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (26, '2012-02-12', 'oncology', 32, 108);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (41, '2023-06-02', 'clinic_1', 102, 128);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (96, '2019-03-25', 'clinic_2', 108, 136);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (77, '2014-03-04', 'clinic_1', 49, 172);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (48, '2019-12-26', 'clinic_2', 73, 297);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (45, '2014-10-14', 'radiology', 35, 237);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (27, '2014-08-06', 'oncology', 34, 227);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (25, '2019-10-29', 'oncology', 0, 125);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (16, '2015-09-14', 'radiology', 57, 214);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (64, '2014-07-04', 'clinic_1', 84, 230);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (37, '2012-12-09', 'clinic_2', 43, 175);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (87, '2019-11-08', 'emergency', 110, 170);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (21, '2013-10-11', 'clinic_1', 60, 160);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (21, '2015-03-30', 'oncology', 35, 204);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (4, '2016-11-30', 'clinic_2', 72, 155);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (50, '2022-10-31', 'radiology', 92, 187);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (22, '2016-02-23', 'oncology', 67, 256);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (9, '2013-08-26', 'emergency', 115, 177);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (77, '2015-02-21', 'emergency', 65, 161);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (93, '2017-09-22', 'clinic_1', 26, 251);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (68, '2012-06-21', 'clinic_2', 6, 218);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (97, '2022-02-17', 'clinic_1', 96, 110);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (7, '2018-08-23', 'clinic_2', 105, 180);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (45, '2014-10-13', 'clinic_1', 64, 288);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (45, '2013-06-01', 'radiology', 43, 180);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (16, '2016-06-05', 'radiology', 64, 168);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (21, '2015-12-09', 'emergency', 6, 236);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (24, '2018-07-28', 'emergency', 40, 234);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (81, '2018-04-11', 'oncology', 71, 239);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (29, '2018-05-20', 'clinic_1', 82, 116);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (8, '2021-05-11', 'radiology', 19, 245);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (87, '2013-04-12', 'oncology', 95, 141);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (74, '2020-02-27', 'clinic_2', 14, 268);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (90, '2016-12-24', 'emergency', 49, 244);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (96, '2023-08-26', 'radiology', 42, 241);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (84, '2019-03-15', 'clinic_1', 18, 170);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (56, '2017-09-08', 'radiology', 88, 263);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (92, '2022-09-12', 'radiology', 58, 225);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (12, '2018-01-17', 'clinic_1', 84, 275);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (87, '2015-05-11', 'radiology', 94, 220);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (11, '2019-07-21', 'clinic_2', 99, 249);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (80, '2014-02-28', 'clinic_2', 60, 237);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (53, '2015-09-16', 'clinic_1', 108, 209);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (63, '2013-07-20', 'clinic_2', 90, 226);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (98, '2016-07-27', 'radiology', 17, 222);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (37, '2021-11-28', 'oncology', 95, 262);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (26, '2020-09-29', 'emergency', 48, 274);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (41, '2020-01-08', 'clinic_1', 58, 194);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (1, '2014-01-25', 'oncology', 93, 264);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (100, '2019-09-16', 'clinic_2', 4, 155);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (22, '2016-10-22', 'emergency', 84, 220);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (79, '2023-08-04', 'oncology', 71, 269);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (21, '2018-08-02', 'emergency', 24, 267);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (60, '2021-03-10', 'oncology', 93, 133);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (71, '2019-04-08', 'emergency', 16, 260);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (17, '2018-04-29', 'clinic_2', 106, 284);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (89, '2017-01-03', 'radiology', 77, 174);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (76, '2012-11-16', 'clinic_1', 116, 290);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (6, '2015-04-18', 'clinic_1', 48, 268);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (10, '2014-05-12', 'clinic_2', 110, 299);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (42, '2012-05-18', 'emergency', 48, 250);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (14, '2014-06-09', 'oncology', 17, 167);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (21, '2015-03-06', 'oncology', 120, 125);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (68, '2020-04-18', 'clinic_1', 92, 145);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (31, '2022-10-12', 'oncology', 46, 238);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (39, '2023-02-03', 'clinic_1', 23, 150);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (52, '2015-07-18', 'oncology', 114, 114);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (33, '2013-11-11', 'clinic_1', 56, 161);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (24, '2013-11-11', 'clinic_2', 113, 102);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (28, '2015-12-24', 'clinic_1', 114, 296);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (72, '2018-09-03', 'oncology', 48, 126);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (45, '2016-10-16', 'clinic_1', 17, 277);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (47, '2016-02-18', 'clinic_2', 49, 154);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (88, '2020-03-24', 'oncology', 63, 252);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (70, '2017-08-10', 'oncology', 35, 220);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (8, '2017-07-14', 'clinic_1', 66, 171);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (43, '2018-11-10', 'emergency', 47, 223);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (15, '2014-02-22', 'emergency', 28, 238);
INSERT INTO source.encounters (patient_id, admit_date, department_name, age, weight) VALUES (29, '2015-08-01', 'radiology', 32, 185);


/*
TARGET RELATIONS
My goal is to create target tables in which my source data will be transformed into a slightly different format.
For example, in my source data, first name and last name for patients are stored in the same field called "name" whereas in 
my target patients table, first and last name are separate attributes.

Another example is address. In my source table, street, zip, state, etc are stored under separate attributes, but in my 
target table, they need to be combined.
*/


--Creating target.patients table 
DROP SCHEMA IF EXISTS target;
CREATE SCHEMA target;
CREATE TABLE target.patients (
	patient_id		SERIAL,
	f_name			TEXT,
	l_name			TEXT,
	gender			TEXT NOT NULL,	-- changing to single-character abbreviation
	race			TEXT,
	birthday		DATE,
	address			TEXT, 			-- street, city, state (two character transformation), zip
	CONSTRAINT patients_pk PRIMARY KEY (patient_id),
	CONSTRAINT patients_gender_ck CHECK (gender IN ('A','E','F','M','U'))
);


--Creating target.departments table
CREATE TABLE target.departments (
	department_id	SERIAL,
	department_name	TEXT,
	CONSTRAINT departments_pk PRIMARY KEY (department_id)
);

--Creating target.encounters table
CREATE TABLE target.encounters(
	encounter_id		SERIAL,
	patient_id		INTEGER,
	admit_date		DATE,
	department_id		INTEGER,
	age			INTEGER,
	weight			INTEGER,	-- in kg (0.453592/pound)
	CONSTRAINT encounters_pk PRIMARY KEY (encounter_id),
	CONSTRAINT encounters_patients_fk FOREIGN KEY (patient_id) REFERENCES target.patients (patient_id),
	CONSTRAINT encounters_departments_fk FOREIGN KEY (department_id) REFERENCES target.departments (department_id),
	CONSTRAINT encounter_age_ck CHECK(age BETWEEN 0 AND 120)
);



-- Target Patients
--Creating a transformation table for states (need to convert full state name to two digit abbreviation)

DROP TABLE IF EXISTS target.states;
CREATE TABLE target.states (
	state	TEXT,
	abbrev	TEXT
);

INSERT INTO target.states VALUES ('North Carolina', 'NC');
INSERT INTO target.states VALUES ('South Carolina', 'SC');
INSERT INTO target.states VALUES ('Virginia', 'VA');

SELECT*
FROM target.states;


-- Splitting patient name into first and last name fields

SELECT split_part(name, ' ', 2) AS f_name, split_part(name, ' ', 1) as l_name
FROM source.patients;


-- Converting gender to single character abbreviations

SELECT CASE
	WHEN gender = 'male' THEN 'M'
	WHEN gender = 'female' THEN 'F'
	WHEN gender = 'transgendered male' THEN 'A'
	WHEN gender = 'transgendered female' THEN 'E'
	ELSE 'U'
	END as gender
FROM source.patients;

-- Using transformation table, converting state names to abbreviations

SELECT (SELECT abbrev FROM target.states t WHERE t.state = s.state)
FROM source.patients s;

-- Forming concatenated address 

SELECT street || ', ' || city || ', ' || (SELECT abbrev FROM target.states t WHERE t.state = s.state) || ', ' || zip AS address
FROM source.patients s;

-- Compiling all SELECt statements into one large one

SELECT patient_id,
	split_part(name, ' ', 2) AS l_name, split_part(name, ' ', 1) as f_name,
	CASE
		WHEN gender = 'male' THEN 'M'
		WHEN gender = 'female' THEN 'F'
		WHEN gender = 'transgendered male' THEN 'A'
		WHEN gender = 'transgendered female' THEN 'E'
		ELSE 'U'
	END as gender,	
	race,
	birthday,
	street || ', ' || city || ', ' || state || ', ' || zip AS address
FROM source.patients;


-- Loading data into Target table

INSERT INTO target.patients
SELECT patient_id,
	split_part(name, ', ', 2) AS f_name, split_part(name, ', ', 1) as l_name,
	CASE
		WHEN gender = 'male' THEN 'M'
		WHEN gender = 'female' THEN 'F'
		WHEN gender = 'transgendered male' THEN 'A'
		WHEN gender = 'transgendered female' THEN 'E'
		ELSE 'U'
	END as gender,	
	race,
	birthday,
	street || ', ' || city || ', ' || (SELECT abbrev FROM target.states t WHERE t.state = s.state) || ', ' || zip AS address
FROM source.patients s ;

SELECT *
FROM target.patients;


-- Finding unique department names in the Source Encounters Table

SELECT department_name 
FROM source.encounters
GROUP BY 1
ORDER BY 1;

-- Inserting into Target Departments table

INSERT INTO target.departments (department_name)
SELECT department_name 
FROM source.encounters
GROUP BY 1
ORDER BY 1;

SELECT *
FROM target.departments;



-- Loading Source Encounters into Target Encounters

-- Converting weight from pounds to kilograms (1lbs = 0.453592kg)

SELECT weight, weight*0.453592 as KG
FROM source.encounters;


-- Converting from department_name to department_id
SELECT (SELECT department_id FROM target.departments t WHERE t.department_name = s.department_name)
FROM source.encounters s;


-- Compiling SELECT statements

SELECT
	encounter_id,
	patient_id,
	admit_date,
	(SELECT department_id FROM target.departments t WHERE t.department_name = s.department_name),
	age,
	weight*0.453592 as KG
FROM source.encounters s;	



-- Loading source data into target encounters

INSERT INTO target.encounters
SELECT
	encounter_id,
	patient_id,
	admit_date,
	(SELECT department_id FROM target.departments t WHERE t.department_name = s.department_name),
	age,
	weight*0.453592 as KG
FROM source.encounters s;	

SELECT *
FROM target.encounters;

--Reviewing all target tables we have created

SELECT *
FROM target.patients;

SELECT *
FROM target.encounters;

SELECT *
FROM target.departments;



-- ALL DONE! 
DROP SCHEMA source CASCADE;
DROP SCHEMA target CASCADE;
