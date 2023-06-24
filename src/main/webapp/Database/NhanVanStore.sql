go
CREATE DATABASE NHANVANSTORE
GO
USE NHANVANSTORE
GO
	 CREATE TABLE Users(
phoneNumber varchar(10) primary key,
password varchar(50) not null,
fullName nvarchar(30) not null,
address nvarchar(100) not null,
email varchar(50) not null,
gender bit ,
birth date,
userImage varchar(50),
role bit
)

CREATE TABLE BookType(
bookTypeCode varchar(20) primary key,
bookTypeName nvarchar(50) not null
)
CREATE TABLE Supplier(
supplierCode varchar(20) primary key ,
supplierName nvarchar(50) not null,
supplierAddress nvarchar(100) not null,
supplierPhone nvarchar(10) not null,
supplierEmail varchar(50) not null
)

CREATE TABLE Book(
	bookCode varchar(20) primary key,
	bookTitle nvarchar(100) not null,
	publishingCompany nvarchar(50),
	publishedYear int ,
	price float not null,
	quantity int not null,
	size varchar(50) ,
	pageNumber int,
	author nvarchar(50) not null,
	content nvarchar(500),
	bookClassification varchar(5),
	bookImage varchar(50),
	supplierID varchar(20) not null,
	bookTypeID varchar(20) not null
	)

	CREATE TABLE Invoice(
	invoiceCode varchar(20) primary key,
	byerName nvarchar(50) not null,
	byerAddress nvarchar(80) not null,
	byerPhone varchar(10) not null,
	purchaseDate date,
	totalInvoice float not null,
	byerAccount varchar(10) not null
	)

	CREATE TABLE DetailInvoice (
	detailInvoiceCode varchar(20) primary key,
	bookCode varchar(20) not null,
	number int not null,
	total float not null,
	invoiceCode varchar(20) not null
	)

	CREATE TABLE Feeback (
	feebackID int identity primary key,
	detailinvoiceCode varchar(20) not null,
	feebackDate date,
	Star float ,
	comment nvarchar(200) 
	)

	create table Cart(
	cartId int identity primary key,
	userId varchar(10) not null,
	bookId varchar(20) not null,
	quantityCart int not null,
	)

	Alter table Book
	add constraint FK_B_S  FOREIGN KEY (supplierID)
  REFERENCES Supplier (supplierCode),
  constraint FK_B_BT  FOREIGN KEY (bookTypeID)
  REFERENCES BookType (bookTypeCode)

  	Alter table Invoice
	add constraint FK_I_U  FOREIGN KEY (byerAccount)
  REFERENCES Users(phoneNumber)

    	Alter table DetailInvoice
	add constraint FK_D_B  FOREIGN KEY (bookCode)
  REFERENCES Book(bookCode),
   constraint FK_D_I  FOREIGN KEY (invoiceCode)
  REFERENCES Invoice (invoiceCode)

    	Alter table Feeback
	add constraint FK_F_D  FOREIGN KEY (detailInvoiceCode)
  REFERENCES DetailInvoice(detailInvoiceCode)
 	Alter table Cart
	add constraint FK_U_C  FOREIGN KEY (userId)
  REFERENCES Users (phoneNumber),
  constraint FK_B_C  FOREIGN KEY (bookId)
  REFERENCES Book (bookCode)
  INSERT INTO Supplier values
  ('S_001GD',N'Giáo Dục',N'289A Khuất Duy Tiến, Trung Hòa, Cầu Giấy, Hà Nội','0989765443','giaoduc@gmail.com'),
    ('S_002NV',N'Nhân Văn',N'1 Trường Chinh, Phường 11, Quận Tân Bình, TP Hồ Chí 
Minh','0956887212','nhanvan@gmail.com'),
  ('S_003SCB',N'Sách Combo',N'47/2C Đường TMT13, Khu phố 2, Phường Trung Mỹ Tây, Quận 12, TPHCM','0909420033','sachcombo@gmail.com'),
    ('S_004NXBT',N'Nhà xuất bản trẻ',N'161B Lý Chính Thắng, Quận 3 – TP.HCM','0808476551','nhaxuatbanre@gmail.com'),
	  ('S_005S938-KT',N'S938-Kho tổng (Nhân Văn)',N'223 Nguyễn Thị Minh Khai, Nguyễn Cư Trinh, quận 1, TP.HCM','0283925069','s938khotong@gmail.com'),
	    ('S_006O',N'Khác',N'223 Nguyễn Thị Minh Khai, Nguyễn Cư Trinh, quận 1, TP.HCM','0283925069','s938khotong@gmail.com')

	  INSERT INTO BookType values
	  ('BT_001SBH',N'Sách Bài Học'),
	  ('BT_002SBT',N'Sách Bài Tập'),
	  ('BT_003SGKB',N'Sách Giáo Khoa Bộ'),
	  ('BT_004STK',N'SáchTham Khảo'),
	  ('BT_005SLT',N'Sách Luyện Thi'),
	  ('BT_006STL',N'Sách Tâm Lý'),
	  ('BT_007SVH',N'Sách Văn Học'),
	  ('BT_008STN',N'Sách Thiếu Nhi'),
	  ('BT_009SKNS',N'Sách Kỹ Năng Sống'),
	  ('BT_010SKT',N'Sách Kinh Tế'),
	  ('BT_011SNDC',N'Sách Nuôi Dạy Con'),
	  ('BT_012SKH',N'Sách Khoa Học'),
	  ('BT_013SKT-DS',N'Sách Kĩ Thuật - Đời Sống'),
	  ('BT_014STL',N'Sách Tư Liệu'),
	  ('BT_015SPL-CT-TH',N'Pháp Luật - Chính Trị - Triết Học'),
	    ('BT_016STT',N'Sách Thưởng Thức'),
	    ('BT_017SNV',N'Sách Ngoại Văn'),
	    ('BT_018SNN',N'Sách Ngoại Ngữ'),
	    ('BT_019SLS-DL-TG',N'Sách Lịch Sử - Địa Lý - Tôn Giáo'),
		('BT_020STDTT',N'Sách Thể Dục Thể Thao'),
		 ('BT_021STD',N'Sách Từ Điển')
		 

		 INSERT INTO Users values
		 ('0908123432','user1',N'Lê Thanh Tùng',N'số 248, đường Cống Quỳnh, quận 1, TP HCM','hantps20520@fpt.edu.vn',1,'2001/12/04',null,0),
		  ('0896756567','user2',N'Nguyễn Hoàng Thiên Ân',N'86A Nguyễn Thái Sơn, P. 3, Q. Gò Vấp, TPHCM','thanhha13022k3@gmail.com',0,'2002/07/12',null,0),
		   ('0567345654','user3',N'Lý Nhã Phương',N'số 185 đường Hoa Lan, phường 2, quận Phú Nhuận, TPHCM','hantps20520@fpt.edu.vn',0,'2000/03/04',null,0),
		 ('0243823224','user4',N'Nguyễn Bảo An',N'số 24A – Đường D5, Phường 25, Phường Bình Thạnh , Thành phố HCM','hanguyent03@gmail.com',1,'1998/06/21',null,0),
			('0356345222','user5',N'Đỗ Hoài Nam',N'138C, Nguyễn Đình Chiểu, Quận 3, TPHCM','thanhha13022k3@gmail.com',1,'2001/12/04',null,0),
		  ('0123456789','admin1',N'Nguyễn Thanh Hà',N'Số 190 Quang Trung, Phường 10, Quận Gò Vấp, TP.HCM','hanguyent03@gmail.com',1,'2001/11/13',null,1),
			 ('0987654321','admin2',N'Phạm Thị Cẩm Vy',N'245 Nguyễn Thị Minh Khai, phường Nguyễn Cư Trinh, Quận 1, TP.HCM ','camvy@gmail.com',0,'2001/04/14',null,1)

			 INSERT INTO Book values
			 ('8934974165576',	N'Bác Sĩ Riêng Của Bé - Chào Con! Ba Mẹ Đã Sẵn Sàng',N'NXB Trẻ',2020,80750,1234,'15.5 x 23 cm',224,N'BS Trần Thị Huyên Thảo',N'"Chào con! Ba mẹ đã sẵn sàng!" - Cuốn sách không chỉ được viết trên nền tảng khoa học của một bác sĩ mà còn chứa chan tình yêu của một người mẹ.
Chắc chắn bạn cũng sẽ cảm nhận được những điểm hay và thực tế trong quyển sách này, từ nền tảng khoa học vững chắc cho đến kiến thức chăm sóc trẻ mới nhất, và nhất là phù hợp với hoàn cảnh của Việt Nam.','G','SNDC_8934974165576.jpg','S_004NXBT','BT_011SNDC'),
			 ('9786040334473',	N'Toán Lớp 5',N'NXB Giáo Dục Việt Nam',2020,13000,1234,'24 x 17 cm',200,N'Nhiều Tác Giả',null,'G','SBH_9786040334473.jpg','S_001GD','BT_001SBH'),
			 ('9786040282934',	N'Bài Tập Ngữ Văn Lớp 8 - Tập 2',N'NXB Giáo Dục Việt Nam',2022,10700,1234,'24 x 17 cm',131,N'Nhiều Tác Giả',null,'G','SBH_9786040334473.jpg','S_001GD','BT_001SBH'),
			 ('9786043373554',	N'Toán Lớp 5',N'NXB Đại Học Huế',2022,69000,1234,'26.5 x 19 x 0.7 cm',124,N'Nhiều Tác Giả',N'Tiếng Anh 10 Bright là khóa học tiếng Anh dành cho học sinh THPT.Bright đã được phát triển bởi một đội ngũ giàu kinh nghiệm gồm các nhà văn, giáo viên quốc tế và Việt Nam để trở nên hoàn hảo cho lớp học Việt Nam và bao gồm đầy đủ chương trình giảng dạy quốc gia của Việt Nam và Khung Tham chiếu Ngôn ngữ Chung Châu Âu (CEFR).','G','SBH_9786040334473.jpg','S_006O','BT_001SBH'),
			 ('9786040237774',	N'Công Nghệ - Lớp 11 - Tái Bản 2021',N'NXB Giáo Dục Việt Nam',2021,14000,1234,'24 x 17 cm',164,N'Bộ Giáo Dục Và Đào Tạo',null,'G','SBH_9786040237774.jpg','S_001GD','BT_001SBH'),
			 ('9786040287595',	N'Tập viết 1 - Tập 2 - Chân Trời Sáng Tạo',N'NXB Giáo Dục Việt Nam',2021,14000,1234,'24 x 17 cm',32,N'Nhiều tác giả',null,'G','SBT_9786040287595.jpg','S_001GD','BT_002SBT'),
			 ('9786040287564',	N'Vở Bài Tập Tiếng Việt Lớp 1 - Chân Trời Sáng Tạo - Tập 1',N'NXB Giáo Dục Việt Nam',2022,12000,1234,'24 x 17 cm',56,N'Nhiều tác giả',N'Vở Bài Tập Tiếng Việt Lớp 1 - Chân Trời Sáng Tạo - Tập 1','G','SBT_9786040287564.jpg','S_001GD','BT_002SBT'),
			 ('9786040282262',	N'Vở Bài Tập Toán Lớp 5 - Tập 1',N'NXB Giáo Dục Việt Nam',2021,11100,1234,'24 x 17 cm',100,N'Nhiều tác giả',null,'G','SBT_9786040287595.jpg','S_001GD','BT_002SBT'),
			 ('9786040282125',	N'Vở Bài Tập Đạo Đức 4',N'NXB Giáo Dục Việt Nam',2021,11100,1234,'24 x 17 cm',56,N'Nhiều tác giả',null,'G','SBT_9786040282125.jpg','S_001GD','BT_002SBT'),
			 ('8936214270149',	N'Luyện Giải Bộ Đề Bồi Dưỡng Học Sinh Giỏi Tiếng Anh Lớp 12',N'NXB Đại Học Quốc Gia Hà Nội',2022,116100,1234,'	26.5 x 19 cm',252,N'Dương Hương',N'10 đề ôn học sinh giỏi sẽ giúp các em làm quen dần với các dạng bài tập hay và khó, thường xuyên xuất hiện trong các đề thi. Phần này sẽ giúp các em ôn lại kỹ càng các kiến thức nền tảng đã được học và chuẩn bị cho mình một tâm lý vững vàng trước khi bước vào kỳ thi học sinh giỏi.','G','SLT_8936214270149.jpg','S_006O','BT_005SLT'),
			  ('2990012000359',	N'1200 Câu Hỏi Trắc Nghiệm Luyện Thi Tú Tài - Đại Học',N'	Đại Học Quốc Gia TP.HCM',2022,22500,1234,'16 x 24',132,N'Lê Thị Kim Dung',N'1200 Câu Hỏi Trắc Nghiệm Luyện Thi Tú Tài - Đại Học Và Cao Đẳng
Cuốn sách được bố cục 2 phần.','G','SLT_2990012000359.jpg','S_002NV','BT_005SLT'),
			  ('8935092807997',	N'100 Bài Văn Chọn Lọc - Lớp 11',N'	NXB Đại Học Quốc Gia Hà Nội',2021,46800,1234,'16 x 24',132,N'Nhiều tác giả',N'Nhằm giúp các em học sinh biết được cách thức phân tích một văn bản và để biết được cách phân tích những diễn biến 
tâm lý và tính cách nhân vật một cách hiệu quả nhất, đội ngũ tác giả đã dày công nghiên cứu và cho ra đời cuốn sách 100 Bài Văn Chọn Lọc 10.','G','STK_8935092807997.jpg','S_006O','BT_004STK'),
			  ('8935083579919',	N'400 Bài Tập Chọn Lọc Tiếng Anh - Lớp 8 - Tái Bản 2020',N'	NXB Hải Phòng',2021,60300,1234,'	24 x 16 x 0.5 cm',183,N'Trình Quang Vinh',N'Việc dạy và học ngoại ngữ nói chung, tiếng Anh nói riêng ở nhà trường phổ thông hiện nay đang được quan tâm đúng mức và phát triển sâu rộng. Để giúp các em có thêm tài liệu tham khảo cần thiết cho việc bổ trợ và nâng cao kiến thức tiếng Anh phổ thông,','G','STK_8935083579919.jpg','S_006O','BT_004STK'),
			  	 ('2021000001968',	N'Bộ Sách Giáo Khoa Bài Học - Lớp 9 - 12 Cuốn - 2023',N'NXB Giáo Dục Việt Nam',2010,136000,1234,'24 x 17 cm',null,N'Bộ Giáo Dục Và Đào Tạo',null,'G','SGKB_2021000001968.jpg','S_001GD','BT_003SGKB'),
				 	 ('2021000001956',	N'Combo Bộ SGK - Lớp 2 - Chân Trời Sáng Tạo - Bài Học + Bao Sách + Bao Tập',N'NXB Giáo Dục Việt Nam',2020,1211000,1234,'24 x 17 cm',null,N'Bộ Giáo Dục Và Đào Tạo',null,'G','SGKB_2021000001956.jpg','S_001GD','BT_003SGKB'),
					  ('2021000001966',	N'Combo Bộ SGK - Lớp 3 - Chân Trời Sáng Tạo - Bài Học + Bao Sách + Bao Tập',N'NXB Giáo Dục Việt Nam',2020,210.000,1234,'24 x 17 cm',null,N'Bộ Giáo Dục Và Đào Tạo',null,'G','SGKB_2021000001966.jpg','S_001GD','BT_003SGKB'),
			 ('8935086853634',	N'Thay Đổi Cuộc Sống Với Nhân Số Học',N'NXB Tổng Hợp TPHCM',2020,223200,1234,'20.5 x 14.5 cm',null,N'	Lê Đỗ Quỳnh Hương',N'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips,','G','STL_8935086853634.jpg','S_006O','BT_006STL'),
			  ('8935086854754',	N'Dale Caregie - Đắc Nhân Tâm - Tái Bản 2021',N'NXB Tổng Hợp TPHCM',2020,77400,1234,'	20.5 x 14.5 cm',320,N'Dale Carnegie',N'Đây là cuốn sách độc nhất về thể loại self-help sở hữu một lượng lớn người hâm mộ. Ngoài ra cuốn sách có doanh số bán ra cao nhất được tờ báo The New York Times bình chọn trong nhiều năm.','H','STL_8935086854754.jpg','S_006O','BT_006STL'),
			 ('8934974179979',	N'Tony Buổi Sáng - Trên Đường Băng - Tái Bản 2022',N'NXB Tổng Hợp TPHCM',2020,94500,1234,'	20.5 x 14.5 cm',320,N'Tony Buổi Sáng',N'TRÊN ĐƯỜNG BĂNG là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.','H','STL_8934974179979.jpg','S_006O','BT_006STL'),
			  ('8935086854624',	N'Bí Mật Tư Duy Triệu Phú - Tái Bản 2021',N'NXB Tổng Hợp TPHCM',2020,97200,1234,'	20.5 x 14.5 cm',320,N'T Harv Eker',null,'H','SKT_8935086854624.jpg','S_004NXBT','BT_010SKT'),
			    ('8935074105295',	N'Doanh Nghiệp Nhỏ - Ý Tưởng Lớn',N'NXB Tổng Hợp TPHCM',2020,61200,1234,'	20.5 x 14.5 cm',320,N'Cynthia Kay',null,'H','SKT_8935074105295.jpg','S_004NXBT','BT_010SKT'),
				 ('8935072885076',	N'Những Chiến Lược Khác Biệt Để Phát Triển Thương Hiệu',N'NXB Tổng Hợp TPHCM',2020,80100,1234,'	20.5 x 14.5 cm',320,N'Công Minh - Tiến Huy',null,'H','SKT_8935072885076.jpg','S_004NXBT','BT_010SKT'),
				  ('8935244890105',	N'Ninja Rantaro - Tập 5',N'Kim Đồng',2020,40000,1234,'	18 x 13 x 1 cm',320,N'Soubee Amako',null,'H','STN_8935244890105.jpg','S_005S938-KT','BT_008STN'),
				   ('8936214270576',	N'Con Tô Màu - Thám Hiểm Động Vật Cổ Đại',N'Mỹ Thuật',2020,28800,1234,'	18 x 13 x 1 cm',320,N'Little Rainbow',null,'H','STN_8936214270576.jpg','S_005S938-KT','BT_008STN'),
				   ('8935250709637',	N'Heartstopper - Tập 3',N'Hội Nhà Văn',2020,150000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Alice Oseman',null,'H','STN_8935250709637.jpg','S_005S938-KT','BT_008STN'),
				   ('8935244886122',	N'Kohei Horikoshi',N'Kim Đồng',2020,25000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Kohei Horikoshi',null,'H','STN_8935244886122.jpg','S_005S938-KT','BT_008STN'),
			 ('8935074130761',N'Thanh Xuân Ấy Tôi Đã Thương Một Người',N'Hồng Đức',2020,99000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Quốc Thái',null,'H','SVH_8935074130761.jpg','S_003SCB','BT_007SVH'),
					   ('8934974185086',	N'Bà Ngoại Tôi Gửi Lời Xin Lỗi - Fredrik Backman',N'NXB Trẻ',2020,171000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Fredrik Backman',null,'H','SVH_8934974185086.jpg','S_003SCB','BT_007SVH'),
		 ('8935246925409',	N'2200 Từ Vựng Tiếng Anh Thông Dụng Nhất',N'Hồng Đức',2020,160200,1234,'20.5 x 14.5 x 1.5 cm',320,N'	Laura',null,'H','STD_8935246925409.jpg','S_002NV','BT_021STD'),
		('8935083594486',	N'Ngôn Ngữ Việt Nam - Từ Điển Tiếng Việtt',N'	NXB Từ Điển Bách Khoa',2020,160200,1234,'20.5 x 14.5 x 1.5 cm',320,N'Nhiều Tác Giả',null,'H','STD_8935083594486.jpg','S_002NV','BT_021STD'),
			('9786043031256',	N'101 Tư Vấn Pháp Luật Thường Thức Về Đất Đai',N'NXB Thanh Niên',2020,94500,1234,'20.5 x 14.5 x 1.5 cm',320,N'	Nguyễn Văn Khôi',null,'H','SPL-CT-TH_9786043031256.jpg','S_002NV','BT_015SPL-CT-TH'),
		('8935279141418',	N'Bộ Luật Dân Sự (Hiện Hành)',N'NXB Chính Trị Quốc Gia Sự Thật',2020,74000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Quốc Hội',null,'H','SPL-CT-TH_8935279141418.jpg','S_002NV','BT_015SPL-CT-TH'),
		('8935279120260',	N'Biên Bản Chiến Tranh 1-2-3-4.75',N'NXB Chính Trị Quốc Gia Sự Thật',2020,206100,1234,'20.5 x 14.5 x 1.5 cm',320,N'Trần Mai Hạnh',null,'H','SPL-CT-TH_8935279120260.jpg','S_002NV','BT_015SPL-CT-TH'),
			('9786045878750',	N'Dẫn Luận Ngắn - Chủ Nghĩa Hiện Sinh',N'Tổng Hợp TP.HCM',2020,75000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Thomas Flynn',null,'H','SPL-CT-TH_9786045878750.jpg','S_002NV','BT_015SPL-CT-TH'),
					('2000112353436',	N'Đại Cương Triết Học Trung Quốc',N'Thanh Niên',2020,135000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Nhiều tác giả',null,'H','SPL-CT-TH_2000112353436.jpg','S_002NV','BT_015SPL-CT-TH'),
					('8935075947580',	N'100 Mẹo Trồng, Chăm Sóc Và Cây Cảnh',N'Thanh Niên',2020,175500,1234,'20.5 x 14.5 x 1.5 cm',320,N'Nhiều tác giả',null,'H','SKT-DS_8935075947580.jpg','S_006O','BT_013SKT-DS'),
						('8936067607826',	N'10 Vạn Câu Hỏi Vì Sao - Sức Khỏe Và Thói Quen',N'Phụ nữ Việt Nam',2020,54000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Trịnh Diên Tuệ',null,'H','SKT-DS_8936067607826.jpg','S_006O','BT_013SKT-DS'),
						('8935072840945',	N'160 Vấn Đề Cần Nên Biết Khi Sử Dụng Đồ Họa Máy Vi Tính',N'	Hồng Đức',2020,54000,1234,'20.5 x 14.5 x 1.5 cm',320,N'	Th.S Dương Minh Qúy',null,'H','SKH_8935072840945.jpg','S_001GD','BT_012SKH'),
						('9786049830488',	N'Excel Dành Cho Người Mới Bắt Đầu (Dành Cho Các Phiên Bản 2019 - 2016 - 2013)',N'Thanh Niên',2020,54000,1234,'20.5 x 14.5 x 1.5 cm',320,N'Trần Tường Thụy',null,'H','SKH_9786049830488.jpg','S_001GD','BT_012SKH')

INSERT INTO Invoice VALUES
('IV001',N'Lê Thanh Tùng',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0988223443','2021/12/04',345000,'0908123432'),
('IV002',N'Lê Thanh Tùng',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0847342675','2022/05/21',125000,'0908123432'),
('IV003',N'Đỗ Hoài Nam',N'138C, Nguyễn Đình Chiểu, Quận 3, TPHCM','0847342675','2022/01/02',435000,'0356345222'),
('IV004',N'DuyênHIN',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0847342675','2022/05/21',198000,'0908123432'),
('IV005',N'Nguyễn Bảo An',N'số 24A – Đường D5, Phường 25, Phường Bình Thạnh , Thành phố HCM','0847342675','2022/08/17',254000,'0243823224'),
('IV006',N'HANT',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0847342675','2021/08/21',125000,'0908123432'),
('IV007',N'Nguyễn Thanh Hà',N'Số 190 Quang Trung, Phường 10, Quận Gò Vấp, TP.HCM','0847342675','2022/05/27',420000,'0567345654'),
('IV008',N'QuynhA',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0847342675','2021/12/12',125000,'0908123432'),
('IV009',N'Nguyễn Bảo An',N'số 24A – Đường D5, Phường 25, Phường Bình Thạnh , Thành phố HCM','0847342675','2021/03/21',67000,'0243823224'),
('IV010',N'HANT',N'số 185 đường Hoa Lan, phường 2, quận Phú Nhuận, TPHCM','0847342675','2021/09/14',201000,'0908123432'),
('IV011',N'HùngNguyen',N'số 185 đường Hoa Lan, phường 2, quận Phú Nhuận, TPHCM','0847342675','2022/02/19',172000,'0987654321')

	INSERT INTO DetailInvoice values 
	('DIC001-IV001','8934974165576',1,48000,'IV001'),
		('DIC002-IV001','9786040334473',3,13000,'IV001'),
		('DIC003-IV001','9786049830488',2,110000,'IV001'),
		('DIC001-IV002','9786040334473',1,13000,'IV002'),
		('DIC002-IV002','8934974179979',2,45000,'IV002'),
		('DIC001-IV011','8935246925409',1,172000,'IV011'),
		('DIC001-IV010','8935279120260',2,100000,'IV010'),
		('DIC001-IV009','8935250709637',1,67000,'IV009'),
		('DIC001-IV006','9786049830488',1,48000,'IV006'),
		('DIC002-IV006','8935072840945',2,36000,'IV006'),
		('DIC001-IV005','8935246925409',2,48000,'IV005'),
		('DIC001-IV003','8935279120260',3,48000,'IV001'),
		('DIC002-IV003','9786040334473',2,10300,'IV003'),
		('DIC001-IV007','8935250709637',2,68000,'IV007'),
		('DIC002-IV007','8934974165576',3,74000,'IV007'),
		('DIC001-IV008','8934974165576',1,125000,'IV008'),
			('DIC001-IV004','8934974165576',2,193000,'IV004'),
			('DIC002-IV005','2000112353436',2,254000,'IV005'),
			('DIC002-IV008','8935279141418',2,125000,'IV008'),
			('DIC003-IV005','8935244886122',5,67000,'IV009')

			insert into Feeback values
			('DIC001-IV001','2021/12/07',4,N'Sách rõ chữ, mới'),
			('DIC001-IV002','2022/05/26',5,N'Sách mới và chữ rõ ràng'),
			('DIC001-IV010','2021/09/20',1,N'Sách có phần bị rách bên lề'),
			('DIC001-IV005','2022/08/25',5,N'Sách có mùi thơm và được tặng sticker'),
			('DIC001-IV003','2022/01/07',4,N'Giao nhanh và shipper thân thiện'),
			('DIC001-IV008','2021/12/15',5,N'Sách khá mới và thơm'),
			('DIC001-IV011','2022/02/21',3,null),
			('DIC001-IV004','2022/05/29',4,null),
			('DIC001-IV007','2021/12/31',4,N'Sách giống mô tả và đẹp'),
			('DIC001-IV009','2021/04/03',5,N'Mới đặt mà hôm sau đã có'),
			('DIC001-IV008','2022/07/14',5,N'Mua ở đây khá nhiều lần, khá ưng ý')

			INSERT INTO Cart values 
			('0987654321','2021000001968',1),
			('0987654321','8935279120260',1),
			('0987654321','8936067607826',2),
			('0123456789','8935083579919',1),
			('0123456789','9786040334473',1),
			('0123456789','8934974179979',2),
			('0123456789','8935086854754',3)

			 --trigger for delete Users
			 	drop trigger if exists TR_DEL_U
				 go
				create trigger  TR_DEL_U ON Users 
				INSTEAD OF DELETE
				AS
				 DELETE FROM Invoice WHERE byerAccount IN (SELECT phoneNumber FROM DELETED)
				  DELETE FROM Cart WHERE userId IN (SELECT phoneNumber FROM DELETED)
				  DELETE FROM Users where phoneNumber in (Select phoneNumber from deleted)
			go


			 --trigger for delete Invoice
			 	drop trigger if exists TR_DEL_I
				 go
				Create trigger  TR_DEL_I ON Invoice 
				INSTEAD OF DELETE
				AS
				 DELETE FROM DetailInvoice WHERE invoiceCode IN (SELECT invoiceCode FROM DELETED)
				  DELETE FROM Invoice where invoiceCode in (Select invoiceCode from deleted)
				 go




				  drop trigger if exists TR_DEL_DI
				  go
				 --trigger for delete DetailInvoice
				create trigger  TR_DEL_DI ON DetailInvoice 
				INSTEAD OF DELETE
				AS
				 DELETE FROM Feeback WHERE detailinvoiceCode IN (SELECT detailInvoiceCode FROM DELETED)
				 DELETE FROM DetailInvoice where detailInvoiceCode in (Select detailInvoiceCode from deleted)

				 go

					 --trigger for delete Book
				drop trigger if exists TR_DEL_B
				 go
				create trigger  TR_DEL_B ON Book 
				INSTEAD OF DELETE
				AS
				 DELETE FROM DetailInvoice  WHERE bookCode IN (SELECT bookCode FROM DELETED)
				  DELETE FROM Cart WHERE bookId IN (SELECT bookCode FROM DELETED)
				  DELETE FROM Book where bookCode in (Select bookCode from deleted)
			go


			 --trigger for delete Supplier
			 	drop trigger if exists TR_DEL_S
				 go
				Create trigger  TR_DEL_S ON Supplier 
				INSTEAD OF DELETE
				AS
				 DELETE FROM Book WHERE supplierID IN (SELECT supplierCode FROM DELETED)
				  DELETE FROM Supplier where supplierCode in (Select supplierCode from deleted)
				 go

				 --trigger for delete DetailInvoice
				 	drop trigger if exists TR_DEL_BT
				 go
				create trigger  TR_DEL_BT ON BookType 
				INSTEAD OF DELETE
				AS
				 DELETE FROM Book WHERE bookTypeID IN (SELECT bookTypeCode FROM DELETED)
				 DELETE FROM BookType where bookTypeCode in (Select bookTypeCode from deleted)


				 go
				 	 	drop trigger if exists TR_ADD_Invoice
						go
				 CREATE TRIGGER TR_ADD_Invoice ON Invoice
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (invoiceCode,1,3) from Invoice where invoiceCode  in (Select invoiceCode from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(invoiceCode,4,2) as int)+1) from Invoice)
		Update Invoice set invoiceCode = CONCAT(@macv,0,@maduoi) where invoiceCode in (Select invoiceCode from inserted)
END


INSERT INTO Invoice VALUEs
('IV000',N'Lê Thanh Tùng',N'350 Trường Chinh, Tân Hưng Thuận, Quận12','0988223443','2021/12/04',345000,'0908123432')
go
	drop trigger if exists TR_ADD_DetailInvoice
	go
		 CREATE TRIGGER TR_ADD_DetailInvoice ON DetailInvoice
FOR INSERT AS
BEGIN
		declare @macv nvarchar(5) = (Select SUBSTRING (detailInvoiceCode,1,5) from DetailInvoice where detailInvoiceCode  in (Select detailInvoiceCode from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(detailInvoiceCode,6,1) as int)+1) from DetailInvoice)
		declare @cuoi nvarchar(6) = (Select SUBSTRING (detailInvoiceCode,7,6) from DetailInvoice where detailInvoiceCode  in (Select detailInvoiceCode from inserted) )
		Update DetailInvoice set detailInvoiceCode = CONCAT(@macv,@maduoi,@cuoi) where detailInvoiceCode in (Select detailInvoiceCode from inserted)
END
					 select * from DetailInvoice where invoiceCode like 'IV016'


					 select * from Invoice where byerAccount like '0243823224' and invoiceCode in (select max(invoiceCode) from Invoice)