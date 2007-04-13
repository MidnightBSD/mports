# New ports collection makefile for:   osh
# Date created:        29 December 2000
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD$ 
# $FreeBSD: ports/shells/osh/Makefile,v 1.17 2006/08/07 07:58:26 miwi Exp $
#

PORTNAME=	osh
PORTVERSION=	060124
CATEGORIES=	shells
MASTER_SITES=	http://jneitzel.sdf1.org/osh/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the UNIX 6th Edition shell

MAN1=		fd2.1 goto.1 if.1 osh.1

post-install:
	@${ECHO_MSG} "updating ${DESTDIR}/etc/shells"
	@${CP} ${DESTDIR}/etc/shells ${DESTDIR}/etc/shells.bak
	@(${GREP} -v ${PREFIX}/bin/osh ${DESTDIR}/etc/shells.bak; \
	 ${ECHO_CMD} ${PREFIX}/bin/osh) > ${DESTDIR}/etc/shells
	@${RM} ${DESTDIR}/etc/shells.bak

.include <bsd.port.mk>
