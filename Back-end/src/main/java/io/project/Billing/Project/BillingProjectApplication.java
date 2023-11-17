package io.project.Billing.Project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class BillingProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BillingProjectApplication.class, args);
	}

}
