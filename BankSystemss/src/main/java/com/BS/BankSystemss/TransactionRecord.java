package com.BS.BankSystemss;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "TransactionRecord")
public class TransactionRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private long amount;
    private String type;
    private Date date;
    private String description;

    @ManyToOne
    @JoinColumn(name = "accountNumber")
    private Data account;

    public TransactionRecord() {
        super();
    }

    public TransactionRecord(long amount, String type, Date date, String description, Data account) {
        this.amount = amount;
        this.type = type;
        this.date = date;
        this.description = description;
        this.account = account;
    }

    // Getters and setters...

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Data getAccount() {
        return account;
    }

    public void setAccount(Data account) {
        this.account = account;
    }
}
