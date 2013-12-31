# $MidnightBSD$

PORTNAME=	openjdk7-bin
PORTVERSION=	7.9.05
CATEGORIES=	java
MASTER_SITES=	LOCAL/laffer1
DISTFILES=	openjdk-${PORTVERSION}_1.tbz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 7 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk7-1.7*

USE_BZIP2=	yes
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:${PORTSDIR}/java/javavmwrapper \
		${LOCALBASE}/lib/X11/fonts/dejavu:${PORTSDIR}/x11-fonts/dejavu

do-install:
	${MV} ${WRKDIR}/openjdk7 ${FAKE_DESTDIR}/${LOCALBASE}/

.include <bsd.port.mk>
