CREATE TABLE `TB_CHARACTER_MAIN`
(
    `character_id`   VARCHAR(255) NOT NULL,
    `character_nm`   VARCHAR(255) NULL,
    `character_type` VARCHAR(255) NULL COMMENT '부장,직속선배 등 화자와의 관계'
);

CREATE TABLE `TB_EPISODE_MAIN`
(
    `episode_id`          VARCHAR(255) NULL,
    `character_id`        VARCHAR(255) NULL,
    `episode_title`       VARCHAR(255) NULL,
    `episode_complete_yn` VARCHAR(255) NULL
);

CREATE TABLE `TB_EPISODE_DIALOG`
(
    `dialog_id`         VARCHAR(255) NOT NULL,
    `episode_id`        VARCHAR(255) NULL,
    `character_id`      VARCHAR(255) NULL,
    `parent_dialog_id`  VARCHAR(255) NULL,
    `left_right`        VARCHAR(255) NULL COMMENT '대화창에서 좌/우 표기 구분자 좌-캐릭터 우-유저',
    `user_choose`       VARCHAR(255) NULL COMMENT '유저가 보는 선택지(~~~를 한다)',
    `dialog_detail`     VARCHAR(255) NULL COMMENT '실제 출력되는 대사',
    `correct_answer_yn` VARCHAR(255) NULL
);

CREATE TABLE `TB_EPISODE_REWARD`
(
    `reward_id`    VARCHAR(255) NULL,
    `episode_id`   VARCHAR(255) NULL,
    `character_id` VARCHAR(255) NULL,
    `reward_nm`    VARCHAR(255) NULL
);

CREATE TABLE `TB_CHARACTER_INFO`
(
    `info_id`           VARCHAR(255) NOT NULL COMMENT '성격/관심사 등',
    `character_id` VARCHAR(255) NULL,
    `info_category_nm`  VARCHAR(255) NULL
);

CREATE TABLE `TB_CHARACTER_INFO_DETAIL`
(
    `info_detail_id` VARCHAR(255) NOT NULL,
    `info_id`        VARCHAR(255) NOT NULL COMMENT '성격/관심사 등',
    `info_detail_nm` VARCHAR(255) NULL COMMENT '한식 등'
);
