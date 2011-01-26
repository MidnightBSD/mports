# New ports collection makefile for:	mdf2iso
# Date created:		2005-05-23
# Whom:			Andrej Zverev <az@inec.ru>
#
# $MidnightBSD: mports/sysutils/mdf2iso/Makefile,v 1.1 2007/07/20 11:53:38 laffer1 Exp $
# $FreeBSD: ports/sysutils/mdf2iso/Makefile,v 1.2 2005/10/03 12:55:22 az Exp $
#

PORTNAME=	mdf2iso
PORTVERSION=	0.3.0
CATEGORIES=	sysutils
MASTER_SITES=	http://download.berlios.de/${PORTNAME}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Alcohol 120% to ISO converter
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/mdf2iso

.include <bsd.port.mk>
