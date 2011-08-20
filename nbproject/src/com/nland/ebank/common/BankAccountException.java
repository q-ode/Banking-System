/**
 * com.nland.ebank.common
 * BankAccountException.java
 * Aug 19, 2011
 */
package com.nland.ebank.common;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public class BankAccountException extends Exception {

	/**
	 *
	 */
	public BankAccountException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public BankAccountException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public BankAccountException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public BankAccountException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}