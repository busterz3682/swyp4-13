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
    `user_id`             BIGINT,
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
    `character_id`      VARCHAR(255) NULL,
    `info_category_nm`  VARCHAR(255) NULL
);

CREATE TABLE `TB_CHARACTER_INFO_DETAIL`
(
    `info_detail_id` VARCHAR(255) NOT NULL,
    `info_id`        VARCHAR(255) NOT NULL COMMENT '성격/관심사 등',
    `info_detail_nm` VARCHAR(255) NULL COMMENT '한식 등'
);

CREATE TABLE UserCard (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          picture VARCHAR(255) NOT NULL,
                          title VARCHAR(20) NOT NULL,
                          content VARCHAR(255) NOT NULL
);
CREATE TABLE Users (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       userCardFk BIGINT DEFAULT NULL,
                       completeProfileTypeTutorial BOOLEAN DEFAULT false NOT NULL,
                       completeUserCardTypeTutorial BOOLEAN DEFAULT false NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       name VARCHAR(100) NOT NULL,
                       createdAt DATETIME DEFAULT NOW () NOT NULL,
                       updatedAt DATETIME DEFAULT NOW () ON UPDATE CURRENT_TIMESTAMP NOT NULL,
                       FOREIGN KEY (userCardFk) REFERENCES UserCard (id)
);
CREATE TABLE Tutorial (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          tutorialType VARCHAR(20) NOT NULL,
                          isStart BOOLEAN DEFAULT false NOT NULL,
                          nextTutorialFk BIGINT,
                          FOREIGN KEY (nextTutorialFk) REFERENCES Tutorial (id)
);
CREATE TABLE TutorialMessage (
                                 id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                 tutorialFk BIGINT,
                                 messageType VARCHAR(20),
                                 FOREIGN KEY (tutorialFk) REFERENCES Tutorial (id)
);
CREATE TABLE TutorialMessageText (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     messageFk BIGINT UNIQUE,
                                     actorType VARCHAR(20) NOT NULL,
                                     textType VARCHAR(20),
                                     content VARCHAR(255) NOT NULL,
                                     FOREIGN KEY (messageFk) REFERENCES TutorialMessage (id)
);
CREATE TABLE TutorialMessageInput (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      messageFk BIGINT UNIQUE,
                                      inputType VARCHAR(20),
                                      FOREIGN KEY (messageFk) REFERENCES TutorialMessage (id)
);
CREATE TABLE TutorialMessageChoice (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       messageFk BIGINT NOT NULL,
                                       reactionTutorialFk BIGINT UNIQUE NOT NULL,
                                       choiceType VARCHAR(20) NOT NULL,
                                       content VARCHAR(255) NOT NULL,
                                       FOREIGN KEY (messageFk) REFERENCES TutorialMessage (id),
                                       FOREIGN KEY (reactionTutorialFk) REFERENCES Tutorial (id)
);