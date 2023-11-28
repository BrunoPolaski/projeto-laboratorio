package io.project.Billing.Project.resource;

import io.project.Billing.Project.dto.BillInsertDTO;
import io.project.Billing.Project.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class BillController {

    private final BillService service;

    @PostMapping
    public ResponseEntity addBill(@RequestBody BillInsertDTO request) {
        var response = service.create(request);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(response.getId()).toUri();

        return ResponseEntity.created(uri).body(response);
    }

    @GetMapping("/unpaid")
    public ResponseEntity getAllUnpaidBills() {
        var response =  service.getAllUnpaidBills();
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @GetMapping("/paid")
    public ResponseEntity getAllPaidBills() {
        var response =  service.getAllPaidBills();
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateBillStatus(@PathVariable Long id) {
        service.updateBillStatus(id);
    }

}
