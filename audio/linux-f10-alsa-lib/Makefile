# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-alsa-lib/Makefile,v 1.16 2011/03/03 09:26:34 ehaupt Exp $

PORTNAME=	alsa-lib
PORTVERSION=	1.0.21
PORTREVISION=	1
CATEGORIES=	audio linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Linux Sound Architecture libraries (Linux Fedora 10)

LICENSE=	lgpl

RUN_DEPENDS=	alsa-lib>0:${PORTSDIR}/audio/alsa-lib

CONFLICTS=	linux-alsa-lib-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	2.fc10
BRANDELF_FILES=	usr/bin/aserver
USE_LDCONFIG=	yes

# We will use native configuration file, so delete a linux one
post-extract:
	@${RM} -r ${WRKSRC}/etc

post-install:
	${MKDIR} ${PREFIX}/etc
	${LN} -fs ${LOCALBASE}/etc/asound.conf ${PREFIX}/etc
	${RM} ${PREFIX}/usr/lib/alsa-lib/smixer/smixer-ac97.la
	${RM} ${PREFIX}/usr/lib/alsa-lib/smixer/smixer-hda.la
	${RM} ${PREFIX}/usr/lib/alsa-lib/smixer/smixer-sbase.la

.include <bsd.port.mk>
