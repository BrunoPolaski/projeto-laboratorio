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

    private String debtor;
    private String email;
    private BigDecimal totalValue;
    private Long numberOfInstallments;
    private boolean paidOff;
    private LocalDateTime createdAt;
    private LocalDateTime dueDate;

    public static Bill of(BillInsertDTO request) {
        return Bill.builder()
                .debtor(request.getDebtor())
                .email(request.getEmail())
                .totalValue(request.getTotalValue())
                .numberOfInstallments(request.getNumberOfInstallments())
                .paidOff(false)
                .createdAt(LocalDateTime.now())
                .dueDate(LocalDateTime.now().plusMonths(1L))
                .build();
    }
}
