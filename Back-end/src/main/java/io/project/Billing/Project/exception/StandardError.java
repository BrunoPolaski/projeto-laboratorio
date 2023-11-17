package io.project.Billing.Project.exception;

import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class StandardError {

    private LocalDateTime localDateTime;
    private Integer status;
    private String error;
    private String path;
}
