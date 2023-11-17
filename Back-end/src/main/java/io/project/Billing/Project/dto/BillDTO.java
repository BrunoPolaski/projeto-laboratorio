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
    private Long numberOfInstallments;
    private BigDecimal installmentValue;
    private boolean isPaidOff;
    private LocalDateTime createdAt;
    private LocalDateTime dueDate;

    public static BillDTO of(Bill entity) {
        return BillDTO.builder()
                .id(entity.getId())
                .email(entity.getEmail())
                .numberOfInstallments(entity.getNumberOfInstallments())
                .installmentValue(entity.getInstallmentValue())
                .isPaidOff(entity.isPaidOff())
                .createdAt(entity.getCreatedAt())
                .dueDate(entity.getDueDate())
                .build();
    }
}
