# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-openmotif/Makefile,v 1.23 2011/03/07 15:08:24 ehaupt Exp $

PORTNAME=	openmotif
PORTVERSION=	2.3.2
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	ftp://ftp.ics.com/openmotif/2.3/${PORTVERSION}/ \
		CRITICAL/rpm
PKGNAMEPREFIX=	linux-f10-
EXTRACT_SUFX=	-1.fc10.i386.rpm
DIST_SUBDIR=	rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motif toolkit Linux libraries
LICENSE=	other

CONFLICTS=	linux-openmotif-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	xorglibs
LINUX_DIST_VER=	10
USE_LDCONFIG=	yes
SRC_DISTFILES=
HASH_FILE=	${MASTERDIR}/distinfo.i386

post-extract:
	@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/bin ${WRKSRC}/usr/include \
		${WRKSRC}/usr/share ${WRKSRC}/usr/lib/X11

.include <bsd.port.mk>
