# New ports collection makefile for:	aim
# Date created:		Sat Jan 13 12:40:20 GMT 2001
# Whom:			Roger Hardiman <roger@freebsd.org>
#
# $MidnightBSD: mports/net-im/aim/Makefile,v 1.4 2008/04/04 05:07:46 ctriv Exp $
# $FreeBSD: ports/net-im/aim/Makefile,v 1.13 2006/09/11 02:14:24 clsung Exp $
#

PORTNAME=	aim
PORTVERSION=	1.5.286
PORTREVISION=	2
CATEGORIES=	net-im linux
MASTER_SITES=	ftp://ftp.newaol.com/aimgen/380469/
DISTNAME=	aim-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AOL's Instant Messenger (AIM) client
LICENSE=	restricted

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libgtk-1.2.so.0:${PORTSDIR}/x11-toolkits/linux-gtk \
		${LINUXBASE}/usr/bin/esdplay:${PORTSDIR}/audio/linux-esound

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX=	yes
USE_XORG=	x11
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
USE_LDCONFIG=	yes
USE_LINUX_PREFIX=	yes
PLIST_SUB=	LINUXBASE=${LINUXBASE}

pre-fake:
	@${ECHO_CMD} "#!/bin/sh" >${WRKDIR}/aim
	@${ECHO_CMD} "ulimit -Sc 0" >>${WRKDIR}/aim
	@${ECHO_CMD} -n "exec ${LINUXBASE}/usr/bin/aim" >>${WRKDIR}/aim
	@${ECHO_CMD} ' "$$@"' >>${WRKDIR}/aim

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/usr/bin/aim ${LINUXBASE}/usr/bin
	${BRANDELF} -t Linux ${LINUXBASE}/usr/bin/aim
	(cd ${WRKSRC}/usr/lib;exec ${TAR} --exclude aim/source -cf - *)|(cd ${LINUXBASE}/usr/lib;exec ${TAR} -xpf -)
	${INSTALL_PROGRAM} ${WRKDIR}/aim ${PREFIX}/bin/aim

.include <bsd.port.mk>
