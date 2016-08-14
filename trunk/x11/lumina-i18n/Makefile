# Created by: Ken Moore <ken@pcbsd.org>
# $FreeBSD: head/x11/lumina-i18n/Makefile 414540 2016-05-03 17:19:02Z kmoore $
# $MidnightBSD$

PORTNAME=	lumina-i18n
PORTVERSION=	0.9.0
DISTVERSIONPREFIX=	v
DISTVERSIONSUFFIX=	-Release
CATEGORIES=	x11

MAINTAINER=	ports@#MidnightBSD.org
COMMENT=	Lumina desktop environment localization files

LICENSE=	bsd3

WRKSRC=		${WRKDIR}/lumina-i18n-0.9.0-Release

RUN_DEPENDS=	lumina>=0:${PORTSDIR}/x11/lumina

USES=		tar:xz
NO_BUILD=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	pcbsd

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/Lumina-DE/i18n
	tar xvf ${WRKSRC}/dist/${PORTNAME}.txz -C ${STAGEDIR}${PREFIX}/share/Lumina-DE/i18n

.include <bsd.port.mk>
