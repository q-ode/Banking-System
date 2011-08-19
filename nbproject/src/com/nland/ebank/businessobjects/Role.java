/*
 * Class name: Role.java
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
 * The Interface Role.
 *
 * @author jazzyF
 * @version $Revision: 1.0 $
 */
public interface Role {

	/**
	 * The names of the roles
	 *
	 */
	enum ROLENAME{Admin, CSR, Manager, SystemUser}

	/**

	 * @return The name of the role */
	public ROLENAME getRoleName();

}
