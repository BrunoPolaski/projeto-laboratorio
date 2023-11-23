package io.project.Billing.Project.model.repositories;

import io.project.Billing.Project.model.entities.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

    List<Bill> findAllByPaidOffIsFalse();

    List<Bill> findAllByPaidOffIsTrue();
}
