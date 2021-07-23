create database Seagull;
go
use Seagull;
go


create table KindType(
	Id int primary key identity,
	[Description] varchar(50) not null,
	CreatedAt datetime default getdate(),
	UpdatedAt datetime default getdate()
);

create table ActionType(
	Id int primary key identity,
	[Description] varchar(50) not null,
	CreatedAt datetime default getdate(),
	UpdatedAt datetime default getdate()
);

create table RiskType(
	Id int primary key identity,
	[Description] varchar(50) not null,
	CreatedAt datetime default getdate(),
	UpdatedAt datetime default getdate()
);

create table Department(
Id int primary key identity,
[Description] nvarchar(260) not null,
);

create table Header(
	Id int primary key identity,
	Title varchar(256) not null,
	KindTypeId int not null,
	ActionTypeId int not null,
	RiskTypeId int not null,
	RiskJustify text not null default 'Not Apply',
	Department varchar(30) not null,
	HistoryBackGround text,
	Username varchar(30) not null,
	Assistant varchar(30) not null default 'Not Apply',
	duration time not null,
	CreateBy varchar(30) not null,
	CreateAt datetime not null DEFAULT getdate(),
	UpdateBy varchar(30) not null,
	UpdateAt datetime not null DEFAULT getdate(),

	foreign key(KindTypeId) references KindType(id),
	foreign key(ActionTypeId) references ActionType(id),
	foreign key(RiskTypeId) references RiskType(id)
);

create table ModifiedItem(
Id int primary key identity,
HeaderId int not null,
[Description] varchar(256) not null,
SchemaOwner varchar(256),
Modification varchar(512),

foreign key (HeaderId) references Header(Id)
);

create table Evidence(
Id int primary key identity,
HeaderId int not null,
[Description] varchar(256) not null,
UrlAttachment text not null,

foreign key (HeaderId) references Header(Id)
);


create table WorkedArea(
Id int primary key identity,
HeaderId int not null,
Username varchar(30) not null,
[Backup] text not null default 'Not Apply',

foreign key (HeaderId) references Header(Id)
);


create table ImpactDetail(
Id int primary key identity,
HeaderId int not null,
SystemName nvarchar(200) not null,
AffectedService nvarchar(260) not null default 'Not Apply',
 
foreign key (HeaderId) references Header(Id)
);

create table ProcedureToFollow(
Id int primary key identity,
HeaderId int not null,
Step int not null,
PreRequeriment nvarchar(260) not null default 'Not Apply',
Detail nvarchar(512) not null,
ExpectedResult nvarchar(512) not null,
EstimatedTime time not null
 
foreign key (HeaderId) references Header(Id)
);

create table EventHandling(
Id int primary key identity,
HeaderId int not null,
EventName nvarchar(260) not null,
ActionName nvarchar(260) not null,
ConditionForRollback nvarchar(260) not null,
AuthorizedForRollback nvarchar(260) not null,

foreign key (HeaderId) references Header(Id)
);

create table PreviousActivity(
Id int primary key identity,
HeaderId int not null,
Responsible nvarchar(260) not null,
Activity nvarchar(512) not null,
DateAt datetime not null,

foreign key (HeaderId) references Header(Id)
);

