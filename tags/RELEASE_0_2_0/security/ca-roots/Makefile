# Ports collection makefile for:  ca-roots
# Date created:			  Sep 5, 2000
# Whom:				  nsayer
#
# $MidnightBSD: mports/security/ca-roots/Makefile,v 1.2 2007/07/20 03:46:02 archite Exp $
# $FreeBSD: ports/security/ca-roots/Makefile,v 1.8 2006/05/30 08:47:36 erwin Exp $
#

PORTNAME=	ca-roots
PORTVERSION=	1.2
CATEGORIES=	security
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A list of SSL CA root certificates

DEPRECATED=	Not supported
EXPIRATION_DATE=2008-07-07


NO_BUILD=	yes

do-install:
		${MKDIR} ${PREFIX}/share/certs
		${INSTALL_DATA} ${FILESDIR}/ca-root.crt ${PREFIX}/share/certs

post-install:
		${LN} -sf ${PREFIX}/share/certs/ca-root.crt /etc/ssl/cert.pem

.include <bsd.port.mk>
