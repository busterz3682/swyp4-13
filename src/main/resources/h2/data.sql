-- insert into `TB_CHARACTER_MAIN` (`character_id`, `character_nm`, `character_type`)
-- values ('chrid001', '권용필', '부장');
--
-- insert into `TB_EPISODE_MAIN` (`episode_id`, `episode_title`)
-- values ('epsd_id001', 'Episode 1. 돌아온 점심시간');
--
-- insert into `TB_EPISODE_REWARD` (`reward_id`, `reward_nm`)
-- values ('rwd_id001', '되묻기');
--
-- insert into `TB_CHARACTER_INFO` (`info_id`, `info_category_nm`)
-- values ('info_id001', '좋아하는것');
--
-- insert into `TB_CHARACTER_INFO_DETAIL` (`info_detail_id`, `info_detail_nm`)
-- values ('detail_id001', '한식');

-- TB_CHARACTER_MAIN
INSERT INTO TB_CHARACTER_MAIN (character_id, character_nm, character_type)
VALUES ('CH001', '김부장', '부장');
INSERT INTO TB_CHARACTER_MAIN (character_id, character_nm, character_type)
VALUES ('CH002', '박대리', '직속후배');
INSERT INTO TB_CHARACTER_MAIN (character_id, character_nm, character_type)
VALUES ('CH003', '최사원', '동기');

-- TB_EPISODE_MAIN
INSERT INTO TB_EPISODE_MAIN (episode_id, character_id, episode_title, episode_complete_yn)
VALUES ('EP001', 'CH001', '첫 출근', 'N');
INSERT INTO TB_EPISODE_MAIN (episode_id, character_id, episode_title, episode_complete_yn)
VALUES ('EP002', 'CH002', '점심 메뉴 고르기', 'N');
INSERT INTO TB_EPISODE_MAIN (episode_id, character_id, episode_title, episode_complete_yn)
VALUES ('EP003', 'CH003', '퇴근 후 한 잔', 'N');

-- TB_EPISODE_DIALOG
INSERT INTO TB_EPISODE_DIALOG (dialog_id, episode_id, character_id, parent_dialog_id, left_right, user_choose, dialog_detail, correct_answer_yn)
VALUES ('DLG001', 'EP001', 'CH001', NULL, '좌', NULL, '안녕하세요, 신입사원?', NULL);
INSERT INTO TB_EPISODE_DIALOG (dialog_id, episode_id, character_id, parent_dialog_id, left_right, user_choose, dialog_detail, correct_answer_yn)
VALUES ('DLG002', 'EP001', NULL, 'DLG001', '우', '네, 안녕하세요!', '네, 안녕하세요! 김부장님!', 'Y');
INSERT INTO TB_EPISODE_DIALOG (dialog_id, episode_id, character_id, parent_dialog_id, left_right, user_choose, dialog_detail, correct_answer_yn)
VALUES ('DLG003', 'EP001', NULL, 'DLG001', '우', '... (꾸벅)', '... (꾸벅)', 'N');

-- TB_EPISODE_REWARD
INSERT INTO TB_EPISODE_REWARD (reward_id, episode_id, character_id, reward_nm)
VALUES ('RWD001', 'EP001', 'CH001', '김부장의 명함');
INSERT INTO TB_EPISODE_REWARD (reward_id, episode_id, character_id, reward_nm)
VALUES ('RWD002', 'EP002', 'CH002', '박대리의 커피 쿠폰');
INSERT INTO TB_EPISODE_REWARD (reward_id, episode_id, character_id, reward_nm)
VALUES ('RWD003', 'EP003', 'CH003', '최사원의 맛집 리스트');

-- TB_CHARACTER_INFO
INSERT INTO TB_CHARACTER_INFO (info_id, character_id, info_category_nm)
VALUES ('INFO001', 'CH001', '성격');
INSERT INTO TB_CHARACTER_INFO (info_id, character_id, info_category_nm)
VALUES ('INFO002', 'CH002', '관심사');
INSERT INTO TB_CHARACTER_INFO (info_id, character_id, info_category_nm)
VALUES ('INFO003', 'CH003', '취미');

-- TB_CHARACTER_INFO_DETAIL
INSERT INTO TB_CHARACTER_INFO_DETAIL (info_detail_id, info_id, info_detail_nm)
VALUES ('DETAIL001', 'INFO001', '엄격함');
INSERT INTO TB_CHARACTER_INFO_DETAIL (info_detail_id, info_id, info_detail_nm)
VALUES ('DETAIL002', 'INFO002', '골프');
INSERT INTO TB_CHARACTER_INFO_DETAIL (info_detail_id, info_id, info_detail_nm)
VALUES ('DETAIL003', 'INFO003', '등산');
