# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.2 2007/08/21 19:31:11 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.3
PORTREVISION=	1
CATEGORIES=	lang
DISTFILES=	nwcc_0.7.3.tar.gz
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	A BSD-licensed C-compiler.

BUILD_DEPENDS=	${LOCALBASE}/bin/nasm:${PORTSDIR}/devel/nasm
RUN_DEPENDS=	${BUILD_DEPENDS}

WRKSRC=		work/nwcc_0.7.3
HAS_CONFIGURE=	yes
ALL_TARGET=	nwcc

.include <bsd.port.mk>
