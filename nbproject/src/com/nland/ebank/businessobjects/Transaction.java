/**
 * com.nland.ebank.businessobjects
 * Transaction.java
 * Aug 19, 2011
 */
package com.nland.ebank.businessobjects;

import java.io.Serializable;
import java.math.BigDecimal;
import java.rmi.Remote;

import com.nland.ebank.common.BankAccountNotFoundException;
import com.nland.ebank.common.TransactionException;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public abstract class Transaction implements Serializable, Remote {

	enum TransactionType{MAINTENANCECHARGE, TAXES, OVERDRAFTFEE}

	/**
	 *
	 */
	private static final long serialVersionUID = 7210987856811238049L;

	/**
	 * @param account

	 * @return the new account balance * @throws TransactionException
	 * @throws BankAccountNotFoundException
	 */
	public abstract BigDecimal creditAccount(Account account) throws TransactionException, BankAccountNotFoundException;

	/**
	 * @param account

	 * @return the new account balance * @throws TransactionException
	 * @throws BankAccountNotFoundException
	 */
	public abstract BigDecimal debitAccount(Account account) throws TransactionException, BankAccountNotFoundException;

}
