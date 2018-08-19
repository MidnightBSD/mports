# $MidnightBSD$

PORTNAME=	openjdk8-bin
PORTVERSION=	8.112.16.1
PORTREVISION=	3
CATEGORIES=	java
MASTER_SITES=	http://pkg.freebsd.org/freebsd:9:x86:64/latest/All/
DISTFILES=	openjdk8-8.112.16_1.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 8 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk8-1.8*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:${PORTSDIR}/java/javavmwrapper \
		dejavu>=2.35:${PORTSDIR}/x11-fonts/dejavu

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 100001
IGNORE=		Only for MidnightBSD 0.9 and lower.
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk8 ${FAKE_DESTDIR}/${LOCALBASE}/

.include <bsd.port.post.mk>
