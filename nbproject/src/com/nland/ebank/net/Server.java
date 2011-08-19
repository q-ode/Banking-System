/*
 * Class name: Server.java
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
package com.nland.ebank.net;

import java.rmi.RemoteException;


/**
 * The Server Interface.
 *
 * @author jazzyF
 * @version $Revision: 1.0 $
 */
public interface Server {

    /**
     * Start the Server.
     *
    
     * @throws RemoteException the remote exception */
    public void start() throws RemoteException;

}
