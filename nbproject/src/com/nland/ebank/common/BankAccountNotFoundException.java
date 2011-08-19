/**
 * com.nland.ebank.common
 * BankAccountNotFoundException.java
 * Aug 19, 2011
 */
package com.nland.ebank.common;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public class BankAccountNotFoundException extends Exception {

	/**
	 *
	 */
	private static final long serialVersionUID = 2776200300711646166L;

	/**
	 *
	 */
	public BankAccountNotFoundException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public BankAccountNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public BankAccountNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public BankAccountNotFoundException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}
