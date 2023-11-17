package io.project.Billing.Project.dto;

import io.project.Billing.Project.model.entities.Bill;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillDTO {

    private Long id;
    private String email;
    private BigDecimal totalValue;
    private Long numberOfInstallments;
    private boolean paidOff;
    private LocalDateTime createdAt;
    private LocalDateTime dueDate;

    public static BillDTO of(Bill entity) {
        return BillDTO.builder()
                .id(entity.getId())
                .email(entity.getEmail())
                .totalValue(entity.getTotalValue())
                .numberOfInstallments(entity.getNumberOfInstallments())
                .paidOff(entity.isPaidOff())
                .createdAt(entity.getCreatedAt())
                .dueDate(entity.getDueDate())
                .build();
    }
}
