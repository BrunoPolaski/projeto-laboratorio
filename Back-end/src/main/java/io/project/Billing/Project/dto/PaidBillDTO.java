package io.project.Billing.Project.dto;

import io.project.Billing.Project.model.PaymentMode;
import io.project.Billing.Project.model.entities.Bill;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaidBillDTO {

    private Long billId;
    private String debtor;
    private PaymentMode paymentMode;
    private BigDecimal totalValue;
    private LocalDateTime totalPaidAt;

    public static PaidBillDTO of(Bill entity) {
        return PaidBillDTO.builder()
                .billId(entity.getId())
                .debtor(entity.getDebtor())
                .paymentMode(entity.getPaymentMode())
                .totalValue(entity.getTotalValue())
                .totalPaidAt(entity.getTotalPaidAt())
                .build();
    }
}
