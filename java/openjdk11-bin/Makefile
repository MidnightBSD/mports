PORTNAME=	openjdk11-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 11 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk11-1.11*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
.if ${OSVERSION} >= 200000
VER=    11.0.7
DISTFILES=	openjdk11-11.0.7+10.2_1.txz
FBSD_PATH=	FreeBSD:11:amd64
COMPONENT=.11
.else
IGNORE=	OS Not Supported
.endif
.else
IGNORE=	architecture not supported
VER=    8.181.13
DISTFILES=      openjdk8-8.181.13.txz
FBSD_PATH=      FreeBSD:11:i386
COMPONENT=.11.${ARCH}
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk11 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk11/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
