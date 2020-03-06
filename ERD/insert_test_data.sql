-- DELETE ALL DATA
DELETE FROM MEMBER WHERE mb_uid <= 3000;
ALTER TABLE MEMBER AUTO_INCREMENT=1; 
DELETE FROM payment WHERE py_uid <= 100;
ALTER TABLE payment AUTO_INCREMENT=1;
DELETE FROM series WHERE sr_uid <= 100;
ALTER TABLE series AUTO_INCREMENT=1;
DELETE FROM goods WHERE g_uid <= 20000;
ALTER TABLE goods AUTO_INCREMENT=1;

ALTER TABLE request AUTO_INCREMENT=1;
ALTER TABLE co_report AUTO_INCREMENT=1;
ALTER TABLE comment AUTO_INCREMENT=1;
ALTER TABLE cart AUTO_INCREMENT=1;
ALTER TABLE g_like AUTO_INCREMENT=1;
ALTER TABLE series_goods AUTO_INCREMENT=1;
ALTER TABLE goods_info AUTO_INCREMENT=1;

-- MEMBER TABLE

INSERT INTO MEMBER
	(mb_uid, mb_id, mb_pw, mb_nn, mb_name ,mb_phone, mb_email, mb_zipcode, mb_addr, mb_addr2) 
VALUES 
	(2, 'user1', '1234', 'user1', '박종일' ,'01012345678', 'pow3790@gmail.com', '12345', '서울 강남구 테헤란로 146', '4층')
	, (3, 'user2', '1234', 'user2', '테스트' ,'01023456789', 'test@test.com', '54321', '서울 강남구 테헤란로 146', '4층')
	, (4, 'user3', '1234', 'user3', '테스트2' ,'01046214321', 'test2@test2.com', '23141', '서울 강남구 테헤란로 146', '4층')
	, (5, 'user4', '1234', 'user4', '테스트3' ,'01041214321', 'test3@test3.com', '41542', '서울 강남구 테헤란로 146', '4층')
	, (6, 'user5', '1234', 'user5', '테스트4' ,'01041244321', 'test4@test4.com', '67565', '서울 강남구 테헤란로 146', '4층')
	, (7, 'user6', '1234', 'user6', '테스트5' ,'01043204321', 'test5@test5.com', '45545', '서울 강남구 테헤란로 146', '4층')
	, (8, 'user7', '1234', 'user7', '테스트6' ,'01023466789', 'test6@test.com', '54321', '서울 강남구 테헤란로 146', '4층')
	, (9, 'user8', '1234', 'user8', '테스트7' ,'01043234321', 'test7@test2.com', '23141', '서울 강남구 테헤란로 146', '4층')
	, (10, 'user9', '1234', 'user9', '테스트8' ,'01000001111', 'test7@test3.com', '41542', '서울 강남구 테헤란로 146', '4층')
	, (11, 'user10', '1234', 'user10', '테스트9' ,'01011112332', 'test8@test4.com', '67565', '서울 강남구 테헤란로 146', '4층')
	, (12, 'user11', '1234', 'user11', '테스트10' ,'01011101232', 'test9@test5.com', '45545', '서울 강남구 테헤란로 146', '4층')
	, (13, 'user12', '1234', 'user12', '테스트11' ,'01011126789', 'test10@test.com', '54321', '서울 강남구 테헤란로 146', '4층')
	, (14, 'user13', '1234', 'user13', '테스트12' ,'01011134321', 'test12@test2.com', '23141', '서울 강남구 테헤란로 146', '4층')
	, (15, 'user14', '1234', 'user14', '테스트13' ,'01011144321', 'test13@test3.com', '41542', '서울 강남구 테헤란로 146', '4층')
	, (16, 'user15', '1234', 'user15', '테스트14' ,'01011154321', 'test14@test4.com', '67565', '서울 강남구 테헤란로 146', '4층')
	, (17, 'user16', '1234', 'user16', '테스트15' ,'01011164321', 'test15@test5.com', '45545', '서울 강남구 테헤란로 146', '4층')
	, (18, 'user17', '1234', 'user17', '테스트16' ,'01011176789', 'test16@test.com', '54321', '서울 강남구 테헤란로 146', '4층')
	, (19, 'user18', '1234', 'user18', '테스트17' ,'01018114321', 'test17@test2.com', '23141', '서울 강남구 테헤란로 146', '4층')
	, (20, 'user19', '1234', 'user19', '테스트18' ,'01011184321', 'test18@test3.com', '41542', '서울 강남구 테헤란로 146', '4층')
	, (21, 'user20', '1234', 'user20', '테스트19' ,'01011194321', 'test19@test4.com', '67565', '서울 강남구 테헤란로 146', '4층')
	, (22, 'user21', '1234', 'user21', '테스트20' ,'01011204321', 'test20@test5.com', '45545', '서울 강남구 테헤란로 146', '4층')
;
INSERT INTO MEMBER
	(mb_uid, mb_id, mb_pw, mb_nn, mb_name ,mb_phone, mb_email, mb_zipcode, mb_addr, mb_addr2, mb_level)
VALUES 
	(1001, 'master', '1234',  'master', 'master' ,'01012355678', 'master@master.master', '34343', '서울 강남구 테헤란로 146', '4층', 3)
	,(1002, 'admin1', '1234',  'admin1', 'admin1' ,'01011111111', 'admin1@admin.admin', '12345', '서울 강남구 테헤란로 146', '4층', 2)
	,(1003, 'admin2', '1234',  'admin2', 'admin2' ,'01022222222', 'admin2@admin.admin', '12345', '서울 강남구 테헤란로 146', '4층', 2)
	,(1004, 'admin3', '1234',  'admin3', 'admin3' ,'01033333333', 'admin3@admin.admin', '12345', '서울 강남구 테헤란로 146', '4층', 2)
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
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(101, 1, '미엘갤러리 쿠션침대K', 'bed1_1.jpg', '1560*2130*1088', 1120000, 123),
	(102, 1, '다나', 'bed2_1.jpg', '2400~2600*1251*720', 2500000, 321),
	(103, 1, '그라운드', 'bed3_1.jpg', '1110*2220*505(100)', 970000, 10),
	(104, 1, '어바니 모션베드', 'bed4_1.jpg', '1260*2130*1088', 1670000, 432),
	(105, 1, '이카리아', 'bed5_1.jpg', '1808*2204*800(300)', 1830000, 400),
	(106, 1, '아르지안', 'bed6_1.jpg', '1808*2204*800(300)', 2580000, 111),
	(107, 1, '미엘갤러리', 'bed7_1.jpg', '1858*2155*1116', 2700000, 222),
	(108, 1, '어바니 트윈모션베드', 'bed8_1.jpg', '1690*2089*1120', 1350000, 101),
	(109, 1, '쿠오', 'bed9_1.jpg', '1545*2112*930(340)', 2800000, 3),
	(110, 1, '시엘', 'bed10_1.jpg', '1563*2112*890 ', 2800000, 0)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(1011, 101, 'CCLBG', 'bed1_1.jpg', 15),
	(1012, 101, 'FIVGY', 'bed1_2.jpg', 20),
	(1021, 102, 'NCCGU', 'bed2_1.jpg', 7),
	(1031, 103, 'CCLBG', 'bed3_1.jpg', 25),
	(1041, 104, 'LD', 'bed4_1.jpg', 10),
	(1042, 104, 'GYM', 'bed4_2.jpg', 19),
	(1051, 105, 'FIVGY', 'bed5_1.jpg', 30),
	(1061, 106, 'GYM', 'bed6_1.jpg', 40),
	(1062, 106, 'LD', 'bed6_2.jpg', 43),
	(1071, 107, 'CCLBG', 'bed7_1.jpg', 33),
	(1081, 108, 'NCCGU', 'bed8_1.jpg', 29),
	(1091, 109, 'CCLBG', 'bed9_1.jpg', 14),
	(1101, 110, 'GYM', 'bed10_1.jpg', 18)
;
-- g_type 2 : 화장대
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(201, 2, '미엘갤러리 화장대 800폭', 'dressingTable1_1.jpg', '800*450*1086', 473000, 10),
	(202, 2, '다나 화장대', 'dressingTable2_1.jpg', '600*520*750', 219000, 20),
	(203, 2, '미엘 화장대', 'dressingTable3_1.jpg', '800*450*721', 262000, 30),
	(204, 2, '메이 라이트 화장대', 'dressingTable4_1.jpg', '800*521*745', 146000, 20),
	(205, 2, '쿠오 화장대 600폭', 'dressingTable5_1.jpg', '580*520*750(1160)', 328000, 21),
	(206, 2, '어바니 화장대(확장형)', 'dressingTable6_1.jpg', '988~1788*441.5*1100', 485000, 11),
	(207, 2, '쿠오 3단 서랍장 세트(H)', 'dressingTable7_1.jpg', '1002*522*1440', 500000, 15),
	(208, 2, '쿠오 3단 서랍장 세트(L)', 'dressingTable8_1.jpg', '1002*522*1440', 626000, 16),
	(209, 2, '어바니 멀티테스크', 'dressingTable9_1.jpg', '988~1788*441.5*746.5', 590000, 19),
	(210, 2, '공용화장대 화장대 일반형', 'dressingTable10_1.jpg', '580*520*750(1160)', 328000, 100)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(2011, 201, 'CCLBG', 'dressingTable1_1.jpg', 50),
	(2012, 201, 'FIVGY', 'dressingTable1_2.jpg', 60),
	(2021, 202, 'GU', 'dressingTable2_1.jpg', 46),
	(2022, 202, 'NCC', 'dressingTable2_2.jpg', 20),
	(2031, 203, 'CCBGM', 'dressingTable3_1.jpg', 43),
	(2032, 203, 'FIVGY', 'dressingTable3_2.jpg', 77),
	(2041, 204, 'NCC', 'dressingTable4_1.jpg', 51),
	(2051, 205, 'CCLBG', 'dressingTable5_1.jpg', 66),
	(2061, 206, 'CGDIO', 'dressingTable6_1.jpg', 28),
	(2062, 206, 'NCC', 'dressingTable6_2.jpg', 32),
	(2071, 207, 'CCBGM', 'dressingTable7_1.jpg', 15),
	(2081, 208, 'FIVIV', 'dressingTable8_1.jpg', 26),
	(2091, 209, 'CCBGM', 'dressingTable9_1.jpg', 9),
	(2092, 209, 'NCC', 'dressingTable9_2.jpg', 30),
	(2101, 210, 'FIVBG', 'dressingTable10_1.jpg', 49),
	(2102, 210, 'FIVIV', 'dressingTable10_2.jpg', 41)
;
-- g_type 3 : 서랍장
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(301, 3, '미엘 아일랜드장 600폭', 'drawer1_1.jpg', '590*450*934', 331000, 123),
	(302, 3, '미엘 5단 서랍장 600폭', 'drawer2_1.jpg', '590*450*1086', 249000, 321),
	(303, 3, '메이 4단 서랍장', 'drawer3_1.jpg', '800*521*1020', 349000, 243),
	(304, 3, '쿠시노 4단 서랍장', 'drawer4_1.jpg', '1025*537*1001.5', 371000, 134),
	(305, 3, '시엘 라이트 4단 서랍장', 'drawer5_1.jpg', '1002*541*1020', 469000, 234),
	(306, 3, '아르지안 4단 서랍장', 'drawer6_1.jpg', '1000*520*1026', 612000, 12),
	(307, 3, '아르지안 5단 서랍장', 'drawer7_1.jpg', ' 590*450*934', 509000, 132),
	(308, 3, '이카리아 1000폭 4단 서랍장 ', 'drawer8_1.jpg', '1000*520*1026', 326000, 123),
	(309, 3, '쿠오 4단 서랍장 1000폭', 'drawer9_1.jpg', '1002*522*1014', 399000, 12),
	(310, 3, '어바니 4단 서랍장 1000폭', 'drawer10_1.jpg', '1002*520*1020', 491000, 42)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(3011, 301, 'CCLBG', 'drawer1_1.jpg', 61),
	(3012, 301, 'FIVGY', 'drawer1_2.jpg', 44),
	(3021, 302, 'CCLBG', 'drawer2_1.jpg', 53),
	(3022, 302, 'FIVGY', 'drawer2_2.jpg', 64),
	(3031, 303, 'CCBGM', 'drawer3_1.jpg', 21),
	(3041, 304, 'NCC', 'drawer4_1.jpg', 30),
	(3051, 305, 'CGDIO', 'drawer5_1.jpg', 17),
	(3061, 306, 'CCLBG', 'drawer6_1.jpg', 80),
	(3071, 307, 'NCC', 'drawer7_1.jpg', 62),
	(3081, 308, 'CGDIO', 'drawer8_1.jpg', 11),
	(3091, 309, 'FIVIV', 'drawer9_1.jpg', 50),
	(3101, 310, 'CGYM', 'drawer10_1.jpg', 67),
	(3102, 310, 'NCC', 'drawer10_2.jpg', 46)
;

-- g_type 4 : 소파
INSERT INTO goods
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES
	(401, 4, '볼케 1인 리클라이너 소파', 'sh1_0.jpg', '875*910~1670*600~1120', 1989000, 123)
	,(402, 4, '스톤 암체어 소파', 'sh2_0.jpg', '750*775*760', 419000, 21)
	,(403, 4, '스노우 1인 소파', 'sh3_0.jpg', '920*865*825', 970000, 21)
	,(404, 4, '스톤 오토만', 'sh4_0.jpg', '650*525*350', 150000, 12)
	,(405, 4, '마리 1인 소파', 'sh5_0.jpg', '820*880*820', 360000, 653)
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
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(501, 5, '미엘 거실장 1200폭', 'lt1_0.jpg', '1200*450*441', 259000, 12)
	,(502, 5, '아르지안 AV장 1600폭', 'lt2_0.jpg', '1600*410*550', 443000, 43)
	,(503, 5, '로타 AV장 2200폭', 'lt3_0.jpg', '2205*433*456', 449000, 32)
	,(504, 5, '어바니 AV장 1200폭', 'lt4_0.jpg', '1195*4215*590', 349000, 523)
	,(505, 5, '레가토 사이드장 600폭', 'lt5_0.jpg', '600*411*400', 669000, 152)
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
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(601, 6, '미엘 미니옷장', 'cl1_0.jpg', '800*590*1900', 387000, 623)
	,(602, 6, '페브릭서랍', 'cl2_0.jpg', '370*460*195', 24000, 23)
	,(603, 6, '멀티수납박스', 'cl3_0.jpg', '340*340*280', 12000, 453)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(6011, 601, 'CCBGM', 'cl1_1.jpg', 3)
	,(6012, 601, 'FIVGYM', 'cl1_2.jpg', 3)
	,(6021, 602, '', 'cl1_2.jpg', 3)
	,(6031, 603, 'XX', 'cl3_1.jpg', 10)
;

-- g_type 7 : 테이블
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(701, 7, '엘바 1800폭 패밀리테이블', 't1_1.jpg', '1800*800*725', 37000, 123)
	,(702, 7, '타우 사이드테이블LPM', 't2_1.jpg', '590*360*632', 7900, 421)
	,(703, 7, '글렌 책상 1400폭', 't3_1.jpg', '1400*600*721', 16600, 123)
	,(704, 7, '로이 1600폭 테이블', 't4_1.jpg', '1600*800*720', 42900, 343)
	,(705, 7, '미엘 원형협탁', 't5_1.jpg', '320*320*372', 10300, 123)
	,(706, 7, '델타듀얼 1200폭 소파테이블', 't6_1.jpg', '1180*540*400', 39900, 76)
	,(707, 7, '파이 400폭 소파테이블', 't7_1.jpg', '400*400*390', 12000, 98)
	,(708, 7, '로타 소파테이블 1200폭', 't8_1.jpg', '1190*590*360', 15900, 23)
	,(709, 7, '카이 1200폭 소파테이블', 't9_1.jpg', '1190*590*501', 34000, 34)
	,(710, 7, '몬트리올 소파테이블 900폭', 't10_1.jpg', '900*900*380', 19000, 54)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(7011, 701, 'nccgy', 't1_nccgy.jpg', 10)
	,(7021, 702, 'fkfk', 't2_fkfk.jpg', 10)
	,(7022, 702, 'gymgy', 't2_gymgy.jpg', 20)
	,(7031, 703, 'nccbg', 't3_nccbg.jpg', 20)
	,(7032, 703, 'nccdg', 't3_nccdg.jpg', 10)
	,(7041, 704, 'ua', 't4_ua.jpg', 7)
	,(7051, 705, 'bwbg', 't5_bwbg.jpg', 8)
	,(7052, 705, 'wggy', 't5_wggy.jpg', 10)
	,(7061, 706, 'ldgym', 't6_ldgym.jpg', 10)
	,(7062, 706, 'umdg', 't6_umdg.jpg', 15)
	,(7071, 707, 'gudg', 't7_gudg.jpg', 5)
	,(7072, 707, 'wpdg', 't7_wpdg.jpg', 3)
	,(7081, 708, 'lddg', 't8_lddg.jpg', 10)
	,(7082, 708, 'uadg', 't8_uadg.jpg', 10)
	,(7091, 709, 'fkad', 't9_fkad.jpg', 15)
	,(7101, 710, 'cgym', 't10_cgym.jpg', 5)
;

-- g_type 8 : 의자
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(801, 8, '비비 의자 (인조가죽)', 'c1_1.jpg', '460*497*830', 20900, 64)
	,(802, 8, '폴 바스툴 (우드쉘)', 'c2_1.jpg', '443*455*896', 11500, 543)
	,(803, 8, '콘 의자 (인조가죽)', 'c3_1.jpg', '421*441*841', 12000, 54)
	,(804, 8, '일룸 원형좌판 스툴', 'c4_1.jpg', '400*400*460', 11400, 12)
	,(805, 8, '미엘 원목스툴', 'c5_1.jpg', '397*397*451', 11900, 6)
	,(806, 8, '쿠오 라운드스툴 (페브릭)', 'c6_1.jpg', '440*440*430', 15400, 453)
	,(807, 8, '아이핏 에어 (헤드레스트)', 'c7_1.jpg', '670*565*1200', 34200, 213)
	,(808, 8, '아이핏 에어 (bk)', 'c8_1.jpg', '670*565*1000', 31700, 34)
	,(809, 8, '아이핏 에어 럼버소프트', 'c9_1.jpg', '670*565*1000', 32700, 321)
	,(810, 8, '베스토 베스토', 'c10_1.jpg', '650*670*1200', 82000, 354)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(8011, 801, 'a534aa', 'c1_a534aa.jpg', 10)
	,(8012, 801, 'a660a', 'c1_a660a.jpg', 10)
	,(8021, 802, 'bwww', 'c2_bwww.jpg', 20)
	,(8031, 803, 'a361ch', 'c3_a361ch.jpg', 20)
	,(8032, 803, 'a361ct', 'c3_a361ct.jpg', 10)
	,(8041, 804, 'f521', 'c4_f521.jpg', 7)
	,(8042, 804, 'iw', 'c4_iw.jpg', 8)
	,(8051, 805, 'cclbg', 'c5_cclbg.jpg', 10)
	,(8052, 805, 'ivlbg', 'c5_ivlbg.jpg', 10)
	,(8061, 806, '2p1', 'c6_2p1.jpg', 15)
	,(8071, 807, '2d6', 'c7_2d6.jpg', 5)
	,(8081, 808, '2d6', 'c8_2d6.jpg', 3)
	,(8091, 809, '2d1', 'c9_2d1.jpg', 10)
	,(8101, 810, 'l091', 'c10_l091.jpg', 10)
	,(8102, 810, 'l095', 'c10_l095.jpg', 15)
;

-- g_type 9 : 책상
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_size, g_price, g_likecnt)
VALUES 
	(901, 9, '로이 5단 다리형 책상 SET', 'd1_1.jpg', '1447*800*1700', 68500, 132)
	,(902, 9, '다나 책상 (책선반형)', 'd2_1.jpg', '1200*740*1096', 31900, 35)
	,(903, 9, '로이 5단 모션데스크 SET', 'd3_1.jpg', '1440*800*1700', 122000, 54)
	,(904, 9, '로이 4단 측판형 책상 SET', 'd4_1.jpg', '1400*740*2038', 62900, 4)
	,(905, 9, '링키 스마트데스크 SET', 'd5_1.jpg', '1200*760*1800', 86600, 435)
	,(906, 9, '로이 5단 다리형 책상 SET', 'd6_1.jpg', '1440*700*1705', 59900, 23)
	,(907, 9, '이타카네오 모션데스크', 'd7_1.jpg', '1400*750*1000', 95900, 78)
	,(908, 9, '이타카네오 책상', 'd8_1.jpg', '1400*600*721', 21000, 365)
	,(909, 9, '이타카네오 직사각형 책상', 'd9_1.jpg', '1600*740*721', 30900, 234)
	,(910, 9, '로이 다리형 책상', 'd10_1.jpg', '1160*600*719', 17900, 467)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(9011, 901, 'gudn', 'd1_gudn.jpg', 10)
	,(9012, 901, 'guhy', 'd1_guhy.jpg', 10)
	,(9021, 902, 'nccbp', 'd2_nccbp.jpg', 20)
	,(9022, 902, 'nccgg', 'd2_nccgg.jpg', 20)
	,(9031, 903, 'gudn', 'd3_gudn.jpg', 10)
	,(9032, 903, 'osdn', 'd3_osdn.jpg', 7)
	,(9041, 904, 'gudn', 'd4_gudn.jpg', 8)
	,(9042, 904, 'guhy', 'd4_guhy.jpg', 10)
	,(9051, 905, 'osca', 'd5_osca.jpg', 10)
	,(9061, 906, 'gymbk', 'd6_gymbk.jpg', 15)
	,(9071, 907, 'ccbgm', 'd7_ccbgm.jpg', 5)
	,(9072, 907, 'umdgm', 'd7_umdgm.jpg', 3)
	,(9081, 908, 'ccbg', 'd8_ccbg.jpg', 10)
	,(9082, 908, 'fivgy', 'd8_fivgy.jpg', 10)
	,(9091, 909, 'ccbgm', 'd9_ccbgm.jpg', 15)
	,(9092, 909, 'umdgm', 'd9_umdgm.jpg', 15)
	,(9101, 910, 'gymbk', 'd10_gymbk.jpg', 15)
;

-- g_type 10 : 책장
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_price, g_likecnt)
VALUES 
	(1001, 10, '에디 800폭 6단책장', 'd1.jpg', 196000, 123),
	(1002, 10, '리브레 2단 책장 1800폭', 'd2.jpg', 219000, 21),
	(1003, 10, '글렌 4단 기본선반장 800폭', 'd3.jpg', 190000, 54),
	(1004, 10, '에디 800폭 2단 깊은책장', 'd4.jpg', 97000, 13),
	(1005, 10, '글렌 6단 기본선반장 600폭(2단서랍형)', 'd5.jpg', 320000, 204),
	(1006, 10, '노마 3단책장 600폭', 'd6.jpg', 129000, 4),
	(1007, 10, '이타카네오 400폭 7단 책장', 'd7.jpg', 149000, 123),
	(1008, 10, '글렌 6단 기본선반장 800폭(2단서랍형)', 'd8.jpg', 352000, 732),
	(1009, 10, '로이 800폭 6단 책장', 'd9.jpg', 196000, 43),
	(1010, 10, '이타카네오 600폭 다용도장', 'd10.jpg', 349000, 34)
;
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(10011, 1001, 'IV', 'd11.jpg', 3),
	(10012, 1001, 'NCC', 'd12.jpg', 3),
	(10013, 1001, 'UA', 'd13.jpg', 3),
	(10021, 1002, 'GYMLD', 'd21.jpg', 3),
	(10031, 1003, 'FKFK', 'd31.jpg', 3),
	(10032, 1003, 'GUDG', 'd32.jpg', 3),
	(10033, 1003, 'NCCBG', 'd33.jpg', 3),
	(10034, 1003, 'NCCGG', 'd34.jpg', 3),
	(10041, 1004, 'IV', 'd41.jpg', 3),
	(10042, 1004, 'NCC', 'd42.jpg', 3),
	(10043, 1004, 'UA', 'd43.jpg', 3),
	(10051, 1005, 'GUDG', 'd51.jpg', 3),
	(10052, 1005, 'NCCBG', 'd52.jpg', 3),
	(10053, 1005, 'NCCGG', 'd53.jpg', 3),
	(10061, 1006, 'FIVBGM', 'd61.jpg', 3),
	(10071, 1007, 'CC', 'd71.jpg', 3),
	(10072, 1007, 'FIV', 'd72.jpg', 3),
	(10073, 1007, 'LD', 'd73.jpg', 3),
	(10074, 1007, 'UM', 'd74.jpg', 3),
	(10081, 1008, 'GUDG', 'd81.jpg', 3),
	(10082, 1008, 'NCCBG', 'd82.jpg', 3),
	(10091, 1009, 'GU', 'd91.jpg', 3),
	(10092, 1009, 'OS', 'd92.jpg', 3),
	(10101, 1010, 'CCBGM', 'd101.jpg', 3),
	(10102, 1010, 'FIVGYM', 'd102.jpg', 3)
;

-- 시리즈 대상 가구 목록 별도 추가
INSERT INTO goods 
	(g_uid, g_type, g_name, g_img, g_price, g_likecnt)
VALUES 
	(811, 8, '비비 의자(페브릭)', 's11.jpg', 209000, 248),
	(711, 7, '비비 1600폭 테이블', 's13.jpg', 459000, 54),
	(712, 7, '비비 1600폭 테이블', 's14.jpg', 429000, 13),
	(311, 3, '이타카네오 3단 서랍장 600폭', 's31.jpg', 250000, 151),
	(604, 6, '이타카네오 서랍형옷장(4형)', 's34.jpg', 559000, 34)
;


-- 시리즈 대상 가구 상세
INSERT INTO goods_info 
	(in_uid, g_uid, in_color, in_img, in_inv)
VALUES
	(8111, 811, 'A534AA', 's111.jpg', 5),
	(8112, 811, 'A660A', 's112.jpg', 5),
	(7111, 711, 'WWAD', 's131.jpg', 5),
	(7121, 712, 'WWAD', 's141.jpg', 5),
	(3111, 311, 'CCBGM', 's311.jpg', 5),
	(3112, 311, 'FIVGYM', 's312.jpg', 5),
	(6041, 604, 'CC', 's341.jpg', 5),
	(6042, 604, 'FIV', 's342.jpg', 5)
;
 

-- SERIES TABLE
INSERT INTO series
	(sr_subject, sr_img)
VALUES
	('비비', 's1.jpg'),
	('어바니', 's2.jpg'),
	('이타카네오', 's3.jpg'),
	('글렌', 's4.jpg'),
	('미엘갤러리', 's6.jpg')
;


-- SERIES_GOODS TABLE
INSERT INTO series_goods
	(g_uid, sr_uid)
VALUES
	(801, 1), (811, 1), (711, 1), (712, 1),
	(104, 2), (108, 2), (206, 2), (209, 2), (310, 2), (504, 2),
	(311, 3), (604, 3), (907, 3), (908, 3), (1007, 3), (1010, 3),
	(703, 4), (1003, 4), (1005, 4), (1008, 4),
	(101, 5), (107, 5), (201, 5), (203, 5), (301, 5), (302, 5), (501, 5), (601, 5), (705, 5), (805, 5)
;

-- g_like TABLE
INSERT INTO g_like
	(mb_uid, g_uid)
VALUES
	(2, 501)
	,(2, 601)
	,(2, 801)
	,(2, 901)
	,(2, 105)
;

-- CART TABLE	
INSERT INTO cart 
	(mb_uid, in_uid, cr_amount)
VALUES 
	(2, 1011, 1)
	,(2, 2011, 1)
	,(2, 3011, 1)
	,(2, 6031, 4)
;

-- PAYMENT TABLE
INSERT INTO payment
	(mb_uid, in_uid, py_amount, py_confirm, py_regdate , py_zipcode, py_addr, py_addr2)
VALUES
	(2, 5011, 1, 1, '2020-02-16','12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 6011, 1, 1, '2020-02-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 7011, 1, 1, '2020-02-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 8011, 1, 1, '2020-01-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 1012, 1, 1, '2020-01-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 2012, 1, 1, '2020-01-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 3012, 1, 1, '2019-12-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(2, 4011, 1, 1, '2019-12-16', '12345', '서울 강남구 테헤란로 146', '4층')
	,(3, 2011, 1, 1, '2020-02-16', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 2011, 1, 1, '2020-02-14', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 2012, 1, 1, '2020-02-10', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 3012, 1, 1, '2020-01-06', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 4011, 1, 1, '2020-01-06', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 4021, 1, 1, '2020-01-06', '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 3012, 1, 1, now(), '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 4011, 1, 1, now(), '54321', '서울 강남구 테헤란로 146', '4층')
	,(3, 4021, 1, 1, now(), '54321', '서울 강남구 테헤란로 146', '4층')
;

-- COMMENT TABLE
INSERT INTO comment
	(mb_uid, py_uid, g_uid, co_subject, co_content)
VALUES
	(2, 1 ,501, '미엘 거실장 사용후기', '배송이 빨라서 좋았습니다.')
	,(2, 2, 502, 'xxxx', 'xxx xxxxx xxx xx xxxx')
	,(2, 3, 303, '미엘 거실장 사용후기', '집 인테리어랑 잘 어울리고 마음에 드네요.')
	,(2, 4, 601, '미엘 미니옷장 사용후기', '집이 좁았는데 적당한 크기의 옷장이라 만족합니다.')
	,(2, 5,702, '사용후기', '좋아요.')
	,(2, 6, 402, '사용후기', '좋아요.')
	,(4, 1, 101, '사용후기', '좋아요.')
	,(5, 1, 101, '사용후기', '좋아요.')
	,(6, 1, 101, '사용후기', '좋아요.')
	,(7, 1, 101, '사용후기', '좋아요.')
	,(6, 2, 1003, '사용후기', '좋아요.')
	,(7, 1, 1003, '사용후기', '좋아요.')
	,(8, 1, 1003, '사용후기', '좋아요.')
	,(9, 1, 1003, '사용후기', '좋아요.')
	,(10, 1, 1003, '테스트', '좋아요.')
	,(11, 1, 1003, '테스트2', '좋아요.')
	,(12, 1, 1003, '테스트3', '좋아요.')
;

-- CO_REPORT TABLE
-- re_type 1 : 광고/음란성
-- re_type 2 : 욕설/반말/부적절한 언어
-- re_type 3 : 회원 분란/비방
-- re_type 4 : 지나친 정지/종교적 언행
-- re_type 5 : 도배성 댓글
-- re_type 6 : 기타

INSERT INTO co_report 
	(co_uid, mb_uid, re_type, re_content)
VALUES
	(2, 2, 1, '광고/음란성 많이 사용')
	,(2, 4, 1, '광고가 심하네여')
	,(2, 5, 1, '광고 ㄴㄴ')
	,(3, 5, 2, '욕했어요')
;

-- REQUEST TABLE
INSERT INTO request
	(mb_uid, rq_type, rq_subject, rq_content, rq_response)
VALUES
	(2, '1', '배송문의', '보통 배송에는 얼마나 걸리나요?', null)
	, (4, '1', '배송문의입니당', '보통 배송에는 얼마나 걸리나요?', null)
	, (3, '1', '배송문의', '어제그제 주문했는데 가구가 안와요 ㅠㅠ', '금방가요')
;

-- test cord

SELECT * FROM MEMBER;
SELECT * FROM goods;
SELECT * FROM goods_info;
SELECT * FROM g_like;
SELECT * FROM series;
SELECT * FROM series_goods;
SELECT * FROM co_report;
SELECT * FROM request;
SELECT * FROM comment;
SELECT * FROM payment;
SELECT * FROM cart;



SELECT p.py_uid "py_uid", g.g_uid "g_uid", gi.in_img "in_img", g.g_name "g_name", p.py_regdate "py_regdate", p.py_amount "py_amount", gi.in_color "in_color", FORMAT((g.g_price*p.py_amount),0) "py_price", p.py_confirm "py_confirm", c.co_uid "co_uid"
			FROM goods g, goods_info gi, `member` m, payment p LEFT OUTER JOIN comment c ON p.py_uid = c.py_uid
			WHERE p.py_uid = 1
			     and m.mb_uid = p.mb_uid
			     and p.in_uid = gi.in_uid
			     and gi.g_uid = g.g_uid;
