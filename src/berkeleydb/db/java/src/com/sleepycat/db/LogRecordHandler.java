/*-
 * See the file LICENSE for redistribution information.
 *
 * Copyright (c) 2000,2008 Oracle.  All rights reserved.
 *
 * $Id: LogRecordHandler.java,v 12.7 2008/01/17 05:04:53 mjc Exp $
 */
package com.sleepycat.db;

/**
A function to process application-specific log records.
**/
public interface LogRecordHandler {
    /**
    A function to process application-specific log records.
    @param environment
    The enclosing database environment.
    @param logRecord
    A log record.
    @param lsn
    The log record's log sequence number.
    @param operation
    The recovery operation being performed.
    @return
    The function must return 0 on success and either the system errno
    or a value outside of the Berkeley DB error name space on failure.
    */
    int handleLogRecord(Environment environment,
                        DatabaseEntry logRecord,
                        LogSequenceNumber lsn,
                        RecoveryOperation operation);
}
