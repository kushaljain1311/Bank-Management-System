package com.BS.BankSystemss;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;

@Entity
@Table(name = "LoanApplication")
public class LoanApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "accountNumber")
    private int accountNumber;

    @Column(name = "loanAmount")
    private double loanAmount;

    @Column(name = "loanType")
    private String loanType;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private String status;

    // Default constructor
    public LoanApplication() { }

    // Parameterized constructor
    public LoanApplication(int accountNumber, double loanAmount, String loanType, String description, String status) {
        this.accountNumber = accountNumber;
        this.loanAmount = loanAmount;
        this.loanType = loanType;
        this.description = description;
        this.status = status;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getAccountNumber() { return accountNumber; }
    public void setAccountNumber(int accountNumber) { this.accountNumber = accountNumber; }

    public double getLoanAmount() { return loanAmount; }
    public void setLoanAmount(double loanAmount) { this.loanAmount = loanAmount; }

    public String getLoanType() { return loanType; }
    public void setLoanType(String loanType) { this.loanType = loanType; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
