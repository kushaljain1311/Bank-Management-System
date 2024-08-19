package com.BS.BankSystemss;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.query.Query;

public class DAO {

    private static SessionFactory sf;

    public static SessionFactory sessionFact() {
        if (sf == null) {
            Configuration cfg = new Configuration();
            Properties p = new Properties();
            p.setProperty(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
            p.setProperty(Environment.URL, "jdbc:mysql://localhost:3307/java76");
            p.setProperty(Environment.USER, "root");
            p.setProperty(Environment.PASS, "pass123");
            p.setProperty(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
            p.setProperty(Environment.HBM2DDL_AUTO, "update"); // Ensure this is set to "update" or "create-drop"
            p.setProperty(Environment.SHOW_SQL, "true");
            p.setProperty(Environment.FORMAT_SQL, "true"); // Optional, for formatted SQL logs

            cfg.setProperties(p)
               .addAnnotatedClass(Data.class)
               .addAnnotatedClass(TransactionRecord.class)
               .addAnnotatedClass(LoanApplication.class); // Add LoanApplication class here

            sf = cfg.buildSessionFactory();
        }
        return sf;
    }

    public static Integer insert(Data d) {
        Integer accountNumber = 0;
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            accountNumber = (Integer) ses.save(d);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during insert operation", e);
        } finally {
            ses.close();
        }

        return accountNumber;
    }

    public static boolean login(String email, String password) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            String hql = "FROM Data WHERE email = :email AND password = :password";
            Query<Data> query = ses.createQuery(hql, Data.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            Data result = query.uniqueResult();
            tx.commit();
            return result != null;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during login operation", e);
        } finally {
            ses.close();
        }
    }

    public static Data getUserByEmail(String email) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            String hql = "FROM Data WHERE email = :email";
            Query<Data> query = ses.createQuery(hql, Data.class);
            query.setParameter("email", email);

            Data user = query.uniqueResult();
            tx.commit();
            return user;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during getUserByEmail operation", e);
        } finally {
            ses.close();
        }
    }

    public static void update(Data d) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            ses.update(d);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during update operation", e);
        } finally {
            ses.close();
        }
    }

    public static void deposit(Integer accountNumber, long amount) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            Data user = ses.get(Data.class, accountNumber);
            if (user != null) {
                user.setBalance(user.getBalance() + amount);
                ses.update(user);

                // Save the transaction record
                TransactionRecord record = new TransactionRecord(amount, "Deposit", new Date(), "Deposited to account", user);
                ses.save(record);

                tx.commit();
            } else {
                throw new RuntimeException("Account not found");
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during deposit operation", e);
        } finally {
            ses.close();
        }
    }

    public static void withdraw(Integer accountNumber, long amount) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            Data user = ses.get(Data.class, accountNumber);
            if (user != null && user.getBalance() >= amount) {
                user.setBalance(user.getBalance() - amount);
                ses.update(user);

                // Save the transaction record
                TransactionRecord record = new TransactionRecord(amount, "Withdraw", new Date(), "Withdrawn from account", user);
                ses.save(record);

                tx.commit();
            } else {
                throw new RuntimeException("Insufficient funds or account not found");
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during withdrawal operation", e);
        } finally {
            ses.close();
        }
    }

    public static void transfer(Integer senderAccountNumber, Integer receiverAccountNumber, long amount) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            Data sender = ses.get(Data.class, senderAccountNumber);
            Data receiver = ses.get(Data.class, receiverAccountNumber);

            if (sender == null) {
                throw new RuntimeException("Sender account not found");
            }
            if (receiver == null) {
                throw new RuntimeException("Receiver account not found");
            }
            if (sender.getBalance() < amount) {
                throw new RuntimeException("Insufficient funds in sender's account");
            }

            sender.setBalance(sender.getBalance() - amount);
            receiver.setBalance(receiver.getBalance() + amount);

            ses.update(sender);
            ses.update(receiver);

            // Save the transaction records
            TransactionRecord senderRecord = new TransactionRecord(amount, "Transfer", new Date(), "Transferred to account " + receiverAccountNumber, sender);
            TransactionRecord receiverRecord = new TransactionRecord(amount, "Transfer", new Date(), "Received from account " + senderAccountNumber, receiver);
            ses.save(senderRecord);
            ses.save(receiverRecord);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during transfer operation", e);
        } finally {
            ses.close();
        }
    }

    // New method to get transactions by account number
    public static List<TransactionRecord> getTransactionsByAccountNumber(Integer accountNumber) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;
        List<TransactionRecord> transactions = null;

        try {
            tx = ses.beginTransaction();
            String hql = "FROM TransactionRecord WHERE account.accountNumber = :accountNumber";
            Query<TransactionRecord> query = ses.createQuery(hql, TransactionRecord.class);
            query.setParameter("accountNumber", accountNumber);

            transactions = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during getTransactionsByAccountNumber operation", e);
        } finally {
            ses.close();
        }

        return transactions;
    }

    public static void saveLoanApplication(LoanApplication loanApplication) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;

        try {
            tx = ses.beginTransaction();
            ses.save(loanApplication);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during saveLoanApplication operation", e);
        } finally {
            ses.close();
        }
    }

    // Method to get loan applications by account number
    public static List<LoanApplication> getLoanApplicationsByAccountNumber(Integer accountNumber) {
        SessionFactory sf = DAO.sessionFact();
        Session ses = sf.openSession();
        Transaction tx = null;
        List<LoanApplication> loans = null;

        try {
            tx = ses.beginTransaction();
            String hql = "FROM LoanApplication WHERE accountNumber = :accountNumber";
            Query<LoanApplication> query = ses.createQuery(hql, LoanApplication.class);
            query.setParameter("accountNumber", accountNumber);
            loans = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Error during getLoanApplicationsByAccountNumber operation", e);
        } finally {
            ses.close();
        }

        return loans;
    }
}
