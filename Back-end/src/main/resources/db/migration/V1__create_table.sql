CREATE TABLE tb_billing (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    created_at TIMESTAMP(6),
    debtor VARCHAR(255),
    due_date TIMESTAMP(6),
    email VARCHAR(255),
    number_of_installments BIGINT,
    paid_installments BIGINT,
    paid_off BOOLEAN NOT NULL,
    payment_mode VARCHAR(255) CHECK ( payment_mode in ('CASH', 'DEBIT_CARD', 'CREDIT_CARD', 'BANK_SLIP')),
    total_paid_at TIMESTAMP(6),
    total_value NUMERIC(38, 2)
);