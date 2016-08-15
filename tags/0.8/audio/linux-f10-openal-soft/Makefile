# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-openal-soft/Makefile,v 1.1 2010/08/19 20:09:06 mva Exp $
#

PORTNAME=	openal-soft
PORTVERSION=	1.8.466
PORTREVISION=	1
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3D positional spatialized sound library (Linux Fedora 10)
LICENSE=	gpl2


USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	alsalib arts esound

RPMVERSION=	7.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libopenal.so.1 usr/lib/libopenal.so.${PORTVERSION} \
		usr/bin/openal-info
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	COPYING
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
