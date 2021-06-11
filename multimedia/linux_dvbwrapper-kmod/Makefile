# Created by: nox@FreeBSD.org

PORTNAME=	linux_dvbwrapper-kmod
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	multimedia
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux compatibility layer - DVB ioctl handler

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

ONLY_FOR_ARCHS=	i386 amd64

USES=		kmod uidfix

PLIST_FILES=	${KMODDIR}/linux_dvbwrapper.ko

CFLAGS+=	${DEBUG_FLAGS}

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} ${FILESDIR}/Makefile ${FILESDIR}/*.[ch] ${WRKSRC}

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${KMODDIR}

.include <bsd.port.mk>
