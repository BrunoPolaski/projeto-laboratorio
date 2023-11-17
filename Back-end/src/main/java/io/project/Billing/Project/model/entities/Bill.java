package io.project.Billing.Project.model.entities;

import io.project.Billing.Project.dto.BillInsertDTO;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tb_billing")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private Long numberOfInstallments;
    private BigDecimal installmentValue;
    private boolean isPaidOff;
    private LocalDateTime createdAt;
    private LocalDateTime dueDate;

    public static Bill of(BillInsertDTO request) {
        return Bill.builder()
                .email(request.getEmail())
                .numberOfInstallments(request.getNumberOfInstallments())
                .installmentValue(request.getInstallmentValue())
                .isPaidOff(false)
                .createdAt(LocalDateTime.now())
                .dueDate(LocalDateTime.now().plusMonths(1L))
                .build();
    }
}
