PORTNAME=	openjdk13-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 13 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk13-1.13*

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
VER=    13.0.3
DISTFILES=	openjdk13-13.0.3+3.1_1.txz
FBSD_PATH=	FreeBSD:11:amd64
COMPONENT=.13
.else
IGNORE=	OS Not Supported
.endif
.else
IGNORE=	architecture not supported
VER=    13.0.3
DISTFILES=      openjdk13-13.0.3+3.1_1.txz
FBSD_PATH=      FreeBSD:11:i386
COMPONENT=.13.${ARCH}
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk13 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk13/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
