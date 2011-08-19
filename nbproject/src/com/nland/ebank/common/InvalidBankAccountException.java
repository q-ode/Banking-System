/**
 * com.nland.ebank.businessobjects
 * InvalidBankAccountException.java
 * Aug 19, 2011
 */
package com.nland.ebank.common;

/**
 * @author jazzyF
 *
 */
public class InvalidBankAccountException extends Exception {

	/**
	 *
	 */
	private static final long serialVersionUID = 5516410459109726547L;

	/**
	 *
	 */
	public InvalidBankAccountException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public InvalidBankAccountException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public InvalidBankAccountException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public InvalidBankAccountException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}
