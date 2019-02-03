# $MidnightBSD$

PORTNAME=	openjdk8-bin
PORTVERSION=	${VER}
PORTREVISION=	4
CATEGORIES=	java
MASTER_SITES=	http://pkg.freebsd.org/${FBSD_PATH}/latest/All/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 8 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk8-1.8*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:${PORTSDIR}/java/javavmwrapper \
		dejavu>=2.35:${PORTSDIR}/x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 100001
VER=	8.172.11
DISTFILES=	openjdk8-8.172.11_1.txz
FBSD_PATH=	freebsd:10:x86:64
COMPONENT=.10
.else
VER=	8.112.16.1
DISTFILES=	openjdk8-8.112.16_1.txz
FBSD_PATH=	freebsd:9:x86:64
COMPONENT=	.9
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk8 ${FAKE_DESTDIR}/${LOCALBASE}/

.include <bsd.port.post.mk>
