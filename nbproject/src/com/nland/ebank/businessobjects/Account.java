/*
 * Class name: Account.java
 *
 * Version 1.0.0
 *
 * Date Aug 19, 2011
 *
 * Author jazzyF
 *
 * Copyright (c) 2011 All rights reserved
 *
 *
 */
package com.nland.ebank.businessobjects;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import com.nland.ebank.common.BankAccountException;
import com.nland.ebank.common.InsufficientFundsException;

// TODO: Auto-generated Javadoc
/**
 * The Class Account.
 *
 * @author jazzyF
 */
public abstract class Account {


	/** The current balance. */
	private BigDecimal currentBalance;

	/** The nuban. */
	private String nuban;

	/** The owner. */
	private Customer owner;

	/** The joint owners. */
	private List<Customer> jointOwners;

	/** The opened since. */
	private Date openedSince;

	/** The closed on. */
	private Date closedOn;


	private List<Transaction> transactions;


	/**
	 * Gets the current balance.
	 *
	 * @return the currentBalance
	 */
	public BigDecimal getCurrentBalance() {
		return currentBalance;
	}

	/**
	 * Sets the current balance.
	 *
	 * @param currentBalance the currentBalance to set
	 */
	public void setCurrentBalance(BigDecimal currentBalance) {
		synchronized(currentBalance) {
			this.currentBalance = currentBalance;
		}
	}

	/**
	 * Gets the nuban.
	 *
	 * @return the nuban
	 */
	public String getNuban() {
		return nuban;
	}

	/**
	 * Sets the nuban.
	 *
	 * @param nuban the new nuban
	 */
	public abstract synchronized void setNuban(String nuban) throws BankAccountException;

	/**
	 * Gets the owner.
	 *
	 * @return the owner
	 */
	public Customer getOwner() {
		return owner;
	}

	/**
	 * Sets the owner.
	 *
	 * @param owner the new owner
	 */
	public abstract synchronized void setOwner(Customer owner) throws BankAccountException;

	/**
	 * Gets the joint owners.
	 *
	 * @return the joint owners
	 */
	public List<Customer> getJointOwners() {
		return jointOwners;
	}

	/**
	 * Sets the joint owners.
	 *
	 * @param jointOwners the new joint owners
	 */
	public abstract void setJointOwner(Customer jointOwner) throws BankAccountException;

	/**
	 * Gets the date the account was opened
	 *
	 * @return The date the account was opened
	 */
	public Date getOpenedSince() {
		return openedSince;
	}

	/**
	 * Sets the date the account was opened
	 *
	 * @param openedSince The date the account was opened
	 */
	public synchronized void setOpenedSince(Date openedSince) {
		this.openedSince = openedSince;
	}

	/**
	 * Gets the date the account was closed
	 *
	 * @return The date the account was closed
	 */
	public Date getClosedOn() {
		return closedOn;
	}

	/**
	 * Sets the closed on.
	 *
	 * @param closedOn - The date the account was closed
	 */
	public synchronized void setClosedOn(Date closedOn) {
		this.closedOn = closedOn;
	}

	/**
	 * @return The list of all transactions associated with this account
	 */
	public List<Transaction> getTransactions() {
		return transactions;
	}

	/**
	 * @param t The transaction to be added
	 */
	public abstract void addTransaction(Transaction t) throws BankAccountException;

	/**
	 * @param amount
	 * @return The new current balance
	 */
	public BigDecimal credit(BigDecimal amount) {
		synchronized(currentBalance) {
			currentBalance.add(amount);
		}
		return currentBalance;
	}

	/**
	 * @param amount
	 * @return The new current balance
	 */
	public abstract BigDecimal debit(BigDecimal amount) throws InsufficientFundsException;
}
