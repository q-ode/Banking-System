/**
 * com.nland.ebank.dao
 * EbankDAOFactory.java
 * Aug 16, 2011
 */
package com.nland.ebank.dao;

/**
 * @author jazzyF
 *
 * @version $Revision: 1.0 $
 */
public interface EbankDAOFactory {

	/**
	 * @return An EbankDAO Instance
	 */
	EbankDAO getEbankDAO();

}
