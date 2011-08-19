/*
 * Class name: Customer.java
 *
 * Version 1.0.0
 *
 * Date Aug 16, 2011
 *
 * Author jazzyF
 *
 * Copyright (c) 2011 All rights reserved
 *
 *
 */
package com.nland.ebank.businessobjects;

import java.util.List;

import com.nland.ebank.common.InvalidBankAccountException;

/**
 * The Class Customer.
 *
 * @author jazzyF
 * @version $Revision: 1.0 $
 */
public class Customer extends User {

	private List<Account> accounts;

	/**
	 * @param account
	 * @return The associated Transactions
	 * @throws InvalidBankAccountException
	 */
	public List<Transaction> getTransactions(Account account) throws InvalidBankAccountException {
		if(accounts.contains(account)) {
			return null;
		} else {
			throw new InvalidBankAccountException();
		}

	}

}
