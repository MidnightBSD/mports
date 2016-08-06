# $MidnightBSD$

PORTNAME=	openjdk7-bin
PORTVERSION=	7.9.05
CATEGORIES=	java
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/
DISTFILES=	openjdk-${PORTVERSION}_1.tbz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 7 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk7-1.7*

USES=		tar:bzip2
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:${PORTSDIR}/java/javavmwrapper \
		dejavu>=2.35:${PORTSDIR}/x11-fonts/dejavu

do-install:
	${MV} ${WRKDIR}/openjdk7 ${FAKE_DESTDIR}/${LOCALBASE}/

.include <bsd.port.mk>
