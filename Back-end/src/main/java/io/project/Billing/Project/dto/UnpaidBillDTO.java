package io.project.Billing.Project.dto;

import io.project.Billing.Project.model.PaymentMode;
import io.project.Billing.Project.model.entities.Bill;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class UnpaidBillDTO {

    private Long billId;
    private String debtor;
    private PaymentMode paymentMode;
    private BigDecimal debtValue;
    private LocalDateTime nextDueDate;

    public static UnpaidBillDTO of(Bill entity) {
        return UnpaidBillDTO.builder()
                .billId(entity.getId())
                .debtor(entity.getDebtor())
                .paymentMode(entity.getPaymentMode())
                .nextDueDate(entity.getDueDate())
                .build();
    }
}
