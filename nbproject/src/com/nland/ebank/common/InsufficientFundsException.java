/**
 * com.nland.ebank.common
 * InsufficientFundsException.java
 * Aug 19, 2011
 */
package com.nland.ebank.common;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public class InsufficientFundsException extends Exception {

	
	public InsufficientFundsException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public InsufficientFundsException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public InsufficientFundsException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public InsufficientFundsException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}