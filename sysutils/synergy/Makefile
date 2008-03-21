# New ports collection makefile for:	synergy
# Date created:		26 March 2003
# Whom:			Kevin Lo <kevlo@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/synergy/Makefile,v 1.1 2007/12/30 00:45:50 laffer1 Exp $
# $FreeBSD: ports/sysutils/synergy/Makefile,v 1.14 2007/07/25 01:25:03 kevlo Exp $
#

PORTNAME=	synergy
PORTVERSION= 	1.3.1
PORTREVISION=	3
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mouse and keyboard sharing utility

GNU_CONFIGURE=	yes
USE_XLIB=	yes
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

DOCS=		AUTHORS COPYING ChangeLog INSTALL NEWS README

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif
	${MKDIR} ${PREFIX}/share/examples/synergy
	${INSTALL_DATA} ${WRKSRC}/examples/synergy.conf ${PREFIX}/share/examples/synergy

.include <bsd.port.mk>
