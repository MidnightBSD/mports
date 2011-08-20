# New ports collection makefile for:	splint
# Date created: 	9 September 1996
# Whom:			moeding
#
# $MidnightBSD: mports/devel/splint/Makefile,v 1.2 2007/11/15 15:21:09 laffer1 Exp $
# $FreeBSD: ports/devel/splint/Makefile,v 1.23 2006/05/04 21:41:07 edwin Exp $
#

PORTNAME=	splint
PORTVERSION=	3.1.2
CATEGORIES=	devel security
MASTER_SITES=	http://www.splint.org/downloads/
EXTRACT_SUFX=	.src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool for statically checking sourcecode for security vulnerabilities
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		splint.1

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/src/Headers/constants.h

	${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} \
		${REINPLACE_CMD} -e '/^pkgdatadir =/s|=.*|=${DATADIR}|'

.include <bsd.port.mk>
