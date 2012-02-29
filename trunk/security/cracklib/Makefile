# New ports collection makefile for:	cracklib
# Date created:				12 Oct 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/cracklib/Makefile,v 1.2 2009/05/01 15:15:51 laffer1 Exp $
#

PORTNAME=	cracklib
PORTVERSION=	2.8.18
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Password-checking library
LICENSE=	lgpl

MAN3=		cracklib.3
MLINKS=		cracklib.3 FascistCheck.3
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-default-dict=${PREFIX}/libdata/${PORTNAME}

post-install:
	${INSTALL_MAN} ${FILESDIR}/cracklib.3 ${MAN3PREFIX}/man/man3/
	@${MKDIR} ${PREFIX}/libdata/${PORTNAME}
	${INSTALL_DATA} ${FILESDIR}/pw_dict* ${PREFIX}/libdata/${PORTNAME}/

.include <bsd.port.mk>
