/* Version: 5.3.0 */
/* Test the default values behaviors in strict and non-strict SQL_MODE */

select "STRICT_TRANS_TABLES" as SQL_MODE;
set @@session.sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
drop table if exists test.demo_default_values;
create table test.demo_default_values(
    id decimal(10) primary key,
    bit_col bit(64),
    tinyint_col tinyint,
    smallint_col smallint,
    mediumint_col mediumint,
    int_col int,
    bigint_col bigint,
    float_col float,
    double_col double,
    decimal_col decimal,
    decimal_83_col decimal(8,3),
    boolean_col boolean,
    date_col date,
    time_col time(6),
    datetime_col datetime(6),
    timestamp_col timestamp(6),
    year_col year,
    varchar_col varchar(16383),
    char_col varchar(30),
    binary_col binary(30),
    varbinary_col varbinary(30),
    tinyblob_col tinyblob,
    mediumblob_col mediumblob,
    blob_col blob,
    longblob_col longblob,
    tinytext_col tinytext,
    mediumtext_col mediumtext,
    longtext_col longtext,
    enum_col enum('e1', 'e2', 'e3'),
    set_col set('e1', 'e2', 'e3'),
    json_col json /* experimental */
);
insert into test.demo_default_values values (1, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default, default);
select * from test.demo_default_values\G

select "NON STRICT_TRANS_TABLES + NOT NULL" as SQL_MODE;
set @@session.sql_mode='ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
drop table if exists test.demo_default_values;
create table test.demo_default_values(
    id decimal(10) primary key,
    bit_col bit(64) not null,
    tinyint_col tinyint not null,
    smallint_col smallint not null,
    mediumint_col mediumint not null,
    int_col int not null,
    bigint_col bigint not null,
    float_col float not null,
    double_col double not null,
    decimal_col decimal not null,
    decimal_83_col decimal(8,3) not null,
    boolean_col boolean not null,
    date_col date not null,
    time_col time(6) not null,
    datetime_col datetime(6) not null,
    timestamp_col timestamp(6) not null,
    year_col year not null,
    varchar_col varchar(16383) not null,
    char_col varchar(30) not null,
    binary_col binary(30) not null,
    varbinary_col varbinary(30) not null,
    tinyblob_col tinyblob not null,
    mediumblob_col mediumblob not null,
    blob_col blob not null,
    longblob_col longblob not null,
    tinytext_col tinytext not null,
    mediumtext_col mediumtext not null,
    longtext_col longtext not null,
    enum_col enum('e1', 'e2', 'e3') not null,
    set_col set('e1', 'e2', 'e3') not null,
    json_col json not null /* experimental */
);
insert into test.demo_default_values (id) values (1);
select * from test.demo_default_values\G

/* Recover default SQL_MODE */
set @@session.sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
