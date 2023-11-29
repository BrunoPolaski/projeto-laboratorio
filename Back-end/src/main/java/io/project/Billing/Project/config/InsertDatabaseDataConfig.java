package io.project.Billing.Project.config;

import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.model.PaymentMode;
import io.project.Billing.Project.model.repositories.BillRepository;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
@RequiredArgsConstructor
public class InsertDatabaseDataConfig implements ApplicationRunner {

    private final BillRepository repository;
    private final BillService service;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        if (repository.count() != 0) return;

        BillInsertDTO insert1 = BillInsertDTO.builder()
                .debtor("Bruno Polaski")
                .email("bruno.polaski@aluno.unc.br")
                .paymentMode(PaymentMode.BANK_SLIP)
                .totalValue(BigDecimal.valueOf(300.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert2 = BillInsertDTO.builder()
                .debtor("James")
                .email("james@email.com")
                .paymentMode(PaymentMode.CREDIT_CARD)
                .totalValue(BigDecimal.valueOf(4000.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert3 = BillInsertDTO.builder()
                .debtor("Douglas Liebl")
                .email("douglasliebl@outlook.com")
                .paymentMode(PaymentMode.BANK_SLIP)
                .totalValue(BigDecimal.valueOf(15000.00))
                .numberOfInstallments(6L).build();

        BillInsertDTO insert4 = BillInsertDTO.builder()
                .debtor("Douglas Liebl")
                .email("douglas.liebl@aluno.unc.br")
                .paymentMode(PaymentMode.DEBIT_CARD)
                .totalValue(BigDecimal.valueOf(300.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert5 = BillInsertDTO.builder()
                .debtor("Douglas Liebl")
                .email("liebldouglas@gmail.com")
                .paymentMode(PaymentMode.CASH)
                .totalValue(BigDecimal.valueOf(600.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert6 = BillInsertDTO.builder()
                .debtor("James")
                .email("james@email.com")
                .paymentMode(PaymentMode.CASH)
                .totalValue(BigDecimal.valueOf(4300.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert7 = BillInsertDTO.builder()
                .debtor("Bruno Polaski")
                .email("bruno@email.com")
                .paymentMode(PaymentMode.CREDIT_CARD)
                .totalValue(BigDecimal.valueOf(700.00))
                .numberOfInstallments(7L).build();

        BillInsertDTO insert8 = BillInsertDTO.builder()
                .debtor("Bruno Polaski")
                .email("bruno.polaski@aluno.unc.br")
                .paymentMode(PaymentMode.DEBIT_CARD)
                .totalValue(BigDecimal.valueOf(8800.00))
                .numberOfInstallments(4L).build();

        BillInsertDTO insert9 = BillInsertDTO.builder()
                .debtor("Douglas Liebl")
                .email("douglasliebl@outlook.com")
                .paymentMode(PaymentMode.BANK_SLIP)
                .totalValue(BigDecimal.valueOf(8800.00))
                .numberOfInstallments(1L).build();

        BillInsertDTO insert10 = BillInsertDTO.builder()
                .debtor("Douglas Liebl")
                .email("douglas@email.com")
                .paymentMode(PaymentMode.CREDIT_CARD)
                .totalValue(BigDecimal.valueOf(3800.00))
                .numberOfInstallments(1L).build();



        service.create(insert1);
        service.create(insert2);
        service.create(insert3);
        service.create(insert4);
        service.create(insert5);
        service.create(insert6);
        service.create(insert7);
        service.create(insert8);
        service.create(insert9);
        service.create(insert10);

    }
}
