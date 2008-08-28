# New ports collection makefile for:	joe
# Date created:		01 Jul 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/editors/joe2/Makefile,v 1.1 2007/04/02 04:22:04 laffer1 Exp $
# $FreeBSD: ports/editors/joe2/Makefile,v 1.23 2005/10/23 10:09:52 pav Exp $
#

PORTNAME=	joe
PORTVERSION=	2.9.8
CATEGORIES+=	editors
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}-editor

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Joe's Own Editor

RUN_DEPENDS=	ispell:${PORTSDIR}/textproc/ispell

LATEST_LINK?=	joe2
CONFLICTS=	joe-3* jupp

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

ALL_TARGET=	${PORTNAME}
MAN1=		${PORTNAME}.1

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/README.cvs ${WRKSRC}/ChangeLog\
		 ${WRKSRC}/INFO ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/LIST ${DOCSDIR}/CommandList
.endif

.include <bsd.port.mk>
