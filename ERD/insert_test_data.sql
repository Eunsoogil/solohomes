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
-- g_type 4 : 쇼파
-- g_type 5 : 거실장
-- g_type 6 : 옷장
-- g_type 7 : 테이블
-- g_type 8 : 의자
-- g_type 9 : 책상
-- g_type 10 : 책장

-- g_type 1 : 침대
INSERT INTO goods 
	(g_type, g_name, g_img, g_size, g_price)
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

-- g_type 4 : 쇼파
-- todo

-- g_type 5 : 거실장
-- todo

-- g_type 6 : 옷장
-- todo

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