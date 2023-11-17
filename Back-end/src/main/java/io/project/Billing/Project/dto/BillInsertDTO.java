package io.project.Billing.Project.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.math.BigDecimal;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class BillInsertDTO {

    private Long id;

    @NotEmpty
    private String email;
    @NotEmpty
    private Long numberOfInstallments;
    @NotEmpty
    private BigDecimal installmentValue;

}
