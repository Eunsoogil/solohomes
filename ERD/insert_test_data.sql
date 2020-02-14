-- MEMBER TABLE

INSERT INTO MEMBER
	(mb_id, mb_pw, mb_nn, mb_name ,mb_phone, mb_email, mb_zipcode, mb_addr, mb_addr2) 
VALUES 
	('user1', '1234', 'user1', '박종일' ,'010-1234-5678', 'pow3790@gmail.com', '12345', '서울 강남구 테헤란로 146', '4층')
	, ('user2', '1234', 'user2', '테스트' ,'010-2345-6789', 'test@test.com', '54321', '서울 강남구 테헤란로 146', '4층')
;
INSERT INTO MEMBER
	(mb_id, mb_pw, mb_nn, mb_name ,mb_phone, mb_email, mb_zipcode, mb_addr, mb_addr2, mb_level)
VALUES 
	('admin', '1234',  'admin', 'admin' ,'010-1234-5678', 'admin@admin.admin', '12345', '서울 강남구 테헤란로 146', '4층', 2)
;

SELECT * FROM MEMBER;

-- GOODS TABLE
-- g_type 1 : 침대
-- g_type 2 : 화장대
-- g_type 3 : 서랍장
-- g_type 4 : 소파
-- g_type 5 : 거실장
-- g_type 6 : 옷장
-- g_type 7 : 테이블
-- g_type 8 : 의자
-- g_type 9 : 책상
-- g_type 10 : 책장

-- uid 알수있게 {type}0x 형식으로 해주세요.. 다른 참조하는 테이블에 넣어줘서 정확한 uid가 필요해요
-- ex) 거실장 501 ~ ... , 옷장 601 ~ ...
-- 가구 상세의 경우 g_uid가 501 이면 각 색상마다 uid를 5011, 5012, 5013 이런식으로 부여해 주세요

-- g_type 1 : 침대
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price)
VALUES 
	()
;
INSERT INTO goods_info 
	(g_uid, in_color, in_img, in_inv)
VALUES
	()
;
-- g_type 2 : 화장대
-- todo

-- g_type 3 : 서랍장
-- todo

-- g_type 4 : 소파
INSERT INTO goods
	(g_uid, g_type, g_name, g_img, g_size, g_price)
VALUES
	(401, 4, '볼케 1인 리클라이너 소파', 'sh1_0.jpg', '875*910~1670*600~1120', 1989000)
	,(402, 4, '스톤 암체어 소파', 'sh2_0.jpg', '750*775*760', 419000)
	,(403, 4, '스노우 1인 소파', 'sh3_0.jpg', '920*865*825', 970000)
	,(404, 4, '스톤 오토만', 'sh4_0.jpg', '650*525*350', 150000)
	,(405, 4, '마리 1인 소파', 'sh5_0.jpg', '820*880*820', 360000)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(4011, 401, 'L660', 'sh1_1.jpg', 1)
	,(4012, 401, 'L663A', 'sh1_2.jpg', 1)
	,(4013, 401, 'L664A', 'sh1_3.jpg', 1)
	,(4014, 401, 'L665L', 'sh1_4.jpg', 1)
	,(4021, 402, '451', 'sh2_1.jpg', 5)
	,(4022, 402, '454A', 'sh2_2.jpg', 5)
	,(4023, 402, '456', 'sh2_3.jpg', 5)
	,(4024, 402, '458', 'sh2_4.jpg', 5)
	,(4031, 403, 'L391A', 'sh3_1.jpg', 5)
	,(4032, 403, 'L391C', 'sh3_2.jpg', 5)
	,(4033, 403, 'L391L', 'sh3_3.jpg', 5)
	,(4041, 404, '451', 'sh4_1.jpg', 5)
	,(4042, 404, '454A', 'sh4_2.jpg', 5)
	,(4043, 404, '456', 'sh4_3.jpg', 5)
	,(4044, 404, '458', 'sh4_4.jpg', 5)
	,(4051, 405, 'L390', 'sh5_1.jpg', 5)
	,(4052, 405, 'L391', 'sh5_2.jpg', 5)
	,(4053, 405, 'L392', 'sh5_3.jpg', 5)
;
-- g_type 5 : 거실장
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price)
VALUES 
	(501, 5, '미엘 거실장 1200폭', 'lt1_0.jpg', '1200*450*441', 259000)
	,(502, 5, '아르지안 AV장 1600폭', 'lt2_0.jpg', '1600*410*550', 443000)
	,(503, 5, '로타 AV장 2200폭', 'lt3_0.jpg', '2205*433*456', 449000)
	,(504, 5, '어바니 AV장 1200폭', 'lt4_0.jpg', '1195*4215*590', 349000)
	,(505, 5, '레가토 사이드장 600폭', 'lt5_0.jpg', '600*411*400', 669000)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(5011, 501, 'CCBGM', 'lt1_1.jpg', 10)
	,(5012, 501, 'FIVGYM', 'lt1_2.jpg', 10)
	,(5021, 502, 'LDGYM', 'lt2_1.jpg', 20)
	,(5022, 502, 'OSGYM', 'lt2_2.jpg', 20)
	,(5031, 503, 'LDGYM', 'lt3_1.jpg', 10)
	,(5032, 503, 'UABG', 'lt3_2.jpg', 7)
	,(5033, 503, 'UMBGM', 'lt3_3.jpg', 8)
	,(5041, 504, 'CGYM', 'lt4_1.jpg', 10)
	,(5042, 504, 'NCC', 'lt4_2.jpg', 10)
	,(5051, 505, 'CCBG', 'lt5_1.jpg', 15)
	,(5052, 505, 'FIVIV', 'lt5_2.jpg', 5)
	,(5053, 505, 'LDGYM', 'lt5_3.jpg', 3)
;

-- g_type 6 : 옷장
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price)
VALUES 
	(601, 6, '미엘 미니옷장', 'cl1_0.jpg', '800*590*1900', 387000)
	,(602, 6, '페브릭서랍', 'cl2_0.jpg', '370*460*195', 24000)
	,(603, 6, '멀티수납박스', 'cl3_0.jpg', '340*340*280', 12000)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(6011, 601, 'CCBGM', 'ch1_1.jpg', 3)
	,(6012, 601, 'FIVGYM', 'ch1_2.jpg', 3)
	,(6031, 603, 'XX', 'ch3_1.jpg', 10)
;

-- g_type 7 : 테이블
-- todo

-- g_type 8 : 의자
-- todo

-- g_type 9 : 책상
-- todo

-- g_type 10 : 책장
-- todo

-- SERIES TABLE
INSERT INTO series
	(sr_subject, sr_img)
VALUES
	()
;

-- SERIES_GOODS TABLE
INSERT INTO series_goods
	(g_uid, sr_uid)
VALUES
	()
;

-- COMMENT TABLE
INSERT INTO comment
	(mb_uid, g_uid, co_subject, co_content)
VALUES
	()
;

-- g_like TABLE
INSERT INTO g_like
	(mb_uid, g_uid)
VALUES
	()
;

-- CART TABLE	
INSERT INTO cart 
	(mb_uid, in_uid, cr_amount)
VALUES 
	()
;

-- PAYMENT TABLE
INSERT INTO payment
	(mb_uid, in_uid, py_amount, py_confirm, py_zipcode, py_addr, py_addr2)
VALUES
	()
;

-- CO_REPORT TABLE
INSERT INTO co_report 
	(co_uid, mb_uid, re_type, re_content)
VALUES
	()
;

-- REQUEST TABLE
INSERT INTO request
	(mb_uid, rq_type, rq_subject, rq_content, rq_response)
VALUES
	()
;