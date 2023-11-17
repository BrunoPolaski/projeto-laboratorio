package io.project.Billing.Project.dto;

import io.project.Billing.Project.model.entities.Bill;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillReturnDTO {

    private Long billId;
    private String debtor;
    private BigDecimal debtValue;
    private LocalDateTime nextDueDate;

    public static BillReturnDTO of(Bill entity) {
        return BillReturnDTO.builder()
                .billId(entity.getId())
                .debtor(entity.getDebtor())
                .debtValue(entity.getTotalValue())
                .nextDueDate(entity.getDueDate())
                .build();
    }
}
