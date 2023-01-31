PORTNAME=	openjdk17-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 17 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk17-*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
.if ${OSVERSION} >= 300000
VER=    17.0.5
DISTFILES=	openjdk17-17.0.5+8.1_1.pkg
FBSD_PATH=	FreeBSD:12:amd64
COMPONENT=.17
.else
IGNORE=	OS Not Supported
.endif
.else
IGNORE=	architecture not supported
VER=    17.0.5
DISTFILES=      openjdk17-17.0.5+8.1_1.pkg
FBSD_PATH=      FreeBSD:12:i386
COMPONENT=.17.${ARCH}
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk17 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk17/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
