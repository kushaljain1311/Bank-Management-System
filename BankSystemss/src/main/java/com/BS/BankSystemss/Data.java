package com.BS.BankSystemss;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "BankSystem")
public class Data {
    @Id
    private Integer accountNumber;
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String phoneno;
    private String gender;
    private long balance;

    public Data() {
        super();
    }

    public Data(Integer accountNumber, String fname, String lname, String email, String password, String phoneno, String gender, long balance) {
        super();
        this.accountNumber = accountNumber;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.phoneno = phoneno;
        this.gender = gender;
        this.balance = balance;
    }

    // Getters and setters...

    public Integer getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(Integer accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public long getBalance() {
        return balance;
    }

    public void setBalance(long balance) {
        this.balance = balance;
    }
}
