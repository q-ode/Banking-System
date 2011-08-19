/*
 * Class name: AccountType.java
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

/**
 * The Interface AccountType.
 *
 * @author jazzyF
 * @version $Revision: 1.0 $
 */
public interface AccountType {

	/**
	 * @author Enumeration of Account types
	 *
	 */
	enum Type {SAVINGS, CURRENT, MORTGAGE, CREDIT}

	/**
	 * @return The account type
	 */
	public Type getAccountType();

}
