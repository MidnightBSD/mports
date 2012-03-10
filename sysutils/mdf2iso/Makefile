# $MidnightBSD: mports/sysutils/mdf2iso/Makefile,v 1.2 2008/09/13 14:53:20 laffer1 Exp $
# $FreeBSD: ports/sysutils/mdf2iso/Makefile,v 1.2 2005/10/03 12:55:22 az Exp $

PORTNAME=	mdf2iso
PORTVERSION=	0.3.0
CATEGORIES=	sysutils
MASTER_SITES=	BERLIOS
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Alcohol 120% to ISO converter
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd7.0

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/mdf2iso

.include <bsd.port.mk>
