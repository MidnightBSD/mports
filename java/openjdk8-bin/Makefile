PORTNAME=	openjdk8-bin
PORTVERSION=	${VER}
PORTREVISION=	5
CATEGORIES=	java
MASTER_SITES=	http://pkg.freebsd.org/${FBSD_PATH}/latest/All/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 8 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk8-1.8*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64 i386
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:${PORTSDIR}/java/javavmwrapper \
		dejavu>=2.35:${PORTSDIR}/x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
.if ${OSVERSION} >= 100001
VER=    8.181.13
DISTFILES=	openjdk8-8.181.13.txz
FBSD_PATH=	FreeBSD:10:amd64
COMPONENT=.10
.else
VER=	8.112.16.1
DISTFILES=	openjdk8-8.112.16_1.txz
FBSD_PATH=	freebsd:9:x86:64
COMPONENT=	.9
.endif
.else
VER=    8.181.13
DISTFILES=      openjdk8-8.181.13.txz
FBSD_PATH=      FreeBSD:10:i386
COMPONENT=.10
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk8 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk8/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
