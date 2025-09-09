--liquibase formatted sql
--changeset junior:202408191938
--comment: cards table create

CREATE TABLE CARDS(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    board_column_id BIGINT NOT NULL,
    priority VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    assigned_to BIGINT,
    CONSTRAINT boards_columns__cards_fk FOREIGN KEY (board_column_id) REFERENCES BOARDS_COLUMNS(id) ON DELETE CASCADE,
    CONSTRAINT users__cards_fk FOREIGN KEY (assigned_to) REFERENCES USERS(id),
    CONSTRAINT board_column_position_uk UNIQUE KEY (board_column_id, position)
) ENGINE=InnoDB;


--rollback DROP TABLE CARDS
