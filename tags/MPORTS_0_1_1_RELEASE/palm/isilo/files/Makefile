# Use BSD_INSTALL_SCRIPT so that it doesn't try to strip the binary, 
# which breaks Linux apps.
#
# $FreeBSD: ports/palm/isilo/files/Makefile,v 1.2 2000/02/03 20:53:28 nik Exp $

install: 
	${BSD_INSTALL_PROGRAM} iSiloBSD ${PREFIX}/bin
	@${BSD_INSTALL_MAN} iSiloBSD.1 ${PREFIX}/man/man1
