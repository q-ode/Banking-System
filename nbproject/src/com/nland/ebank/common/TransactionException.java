/**
 * com.nland.ebank.businessobjects
 * TransactionException.java
 * Aug 19, 2011
 */
package com.nland.ebank.common;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public class TransactionException extends Exception {

	/**
	 *
	 */
	private static final long serialVersionUID = -4225507764622248884L;

	/**
	 *
	 */
	public TransactionException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public TransactionException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public TransactionException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public TransactionException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}
