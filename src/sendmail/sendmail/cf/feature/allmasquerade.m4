divert(-1)
#
# Copyright (c) 1998-2000 Sendmail, Inc. and its suppliers.
#	All rights reserved.
# Copyright (c) 1983 Eric P. Allman.  All rights reserved.
# Copyright (c) 1988, 1993
#	The Regents of the University of California.  All rights reserved.
#
# By using this file, you agree to the terms and conditions set
# forth in the LICENSE file which can be found at the top level of
# the sendmail distribution.
#
#

divert(0)
VERSIONID(`$Id: allmasquerade.m4,v 1.1.1.4 2002/03/12 17:59:46 zarzycki Exp $')
divert(-1)

ifdef(`_MAILER_local_',
	`errprint(`*** MAILER(`local') must appear after FEATURE(`allmasquerade')')
')dnl
ifdef(`_MAILER_uucp_',
	`errprint(`*** MAILER(`uucp') must appear after FEATURE(`allmasquerade')')
')dnl
define(`_ALL_MASQUERADE_', 1)
