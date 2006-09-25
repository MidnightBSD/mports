# Ports collection makefile for:  ca-roots
# Date created:			  Sep 5, 2000
# Whom:				  nsayer
#
# $MidnightBSD$
# $FreeBSD: ports/security/ca-roots/Makefile,v 1.8 2006/05/30 08:47:36 erwin Exp $
#

PORTNAME=	ca-roots
PORTVERSION=	1.2
CATEGORIES=	security
DISTFILES=	# none

MAINTAINER=	nivo+kw+ports.bfa274@is-root.com
COMMENT=	A list of SSL CA root certificates

NO_BUILD=	yes

do-install:
		${MKDIR} ${PREFIX}/share/certs
		${INSTALL_DATA} ${FILESDIR}/ca-root.crt ${PREFIX}/share/certs
		${LN} -sf ${PREFIX}/share/certs/ca-root.crt /etc/ssl/cert.pem

.include <bsd.port.mk>
