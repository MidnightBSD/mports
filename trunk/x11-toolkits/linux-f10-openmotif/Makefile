# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-openmotif/Makefile,v 1.23 2011/03/07 15:08:24 ehaupt Exp $

PORTNAME=	openmotif
PORTVERSION=	2.3.3
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	ftp://ftp.ics.com/openmotif/2.3/${PORTVERSION}/ \
		FREEBSD_LOCAL/ehaupt/rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motif toolkit Linux libraries

LICENSE=	other

CONFLICTS=	linux-openmotif-[0-9]*


USE_LINUX=	f10
RPMVERSION=	1.fc10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	xorglibs
USE_LDCONFIG=	yes
SRC_DISTFILES=
DISTINFO_FILE=	${MASTERDIR}/distinfo.i386

post-extract:
		@${RM} -r ${WRKSRC}/etc ${WRKSRC}/usr/bin ${WRKSRC}/usr/include \
			${WRKSRC}/usr/share ${WRKSRC}/usr/lib/X11

.include <bsd.port.mk>
