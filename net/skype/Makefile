# New ports collection makefile for:	skype
# Date created:         Jun 21. 2004
# Whom:                 netchild@FreeBSD.org
#
# $MidnightBSD: mports/net/skype/Makefile,v 1.1 2008/04/11 03:20:43 laffer1 Exp $
# $FreeBSD: ports/net/skype/Makefile,v 1.37 2007/11/01 12:24:53 beech Exp $
#

PORTNAME=	skype
PORTVERSION=	1.2.0.18
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net
MASTER_SITES=	NETBSD
DISTNAME=	skype_staticQT-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	P2P VoIP software
LICENSE=	restricted

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libfontconfig.so.1:${PORTSDIR}/x11-fonts/linux-fontconfig \
		${LINUXBASE}/usr/lib/libexpat.so.0:${PORTSDIR}/textproc/linux-expat

USE_BZIP2=	yes
USE_LINUX=	yes

RESTRICTED=	Redistribution prohibited.

OPTIONS=	NVIDIA_GL "Enable Nvidia Support" off

.include <bsd.port.pre.mk>

.if defined(WITH_NVIDIA_GL)
RUN_DEPENDS+=	${LINUXBASE}/usr/lib/libGL.so.1:${PORTSDIR}/x11/nvidia-driver
.else
RUN_DEPENDS+=	${LINUXBASE}/usr/X11R6/lib/libGL.so.1:${PORTSDIR}/graphics/linux_dri
.endif

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}

do-build:
	${BRANDELF} -t Linux ${WRKSRC}/skype

do-install:
	@${INSTALL} -d ${PREFIX}/share/applications
	@${INSTALL_PROGRAM} ${WRKSRC}/skype ${PREFIX}/bin/skype_bin
	@${ECHO_CMD} -e "#!/bin/sh\n\nSKYPE_RESOURCES_PATH='${LOCALBASE}/share/skype' skype_bin \"\$$@\" 2>&1 | grep -v 'SOUND_MIXER_WRITE_IGAIN failed'" >${PREFIX}/bin/skype
	@${CHMOD} a+rx ${PREFIX}/bin/skype
	@${INSTALL_DATA} ${WRKSRC}/skype.desktop ${PREFIX}/share/applications/
	${MKDIR} ${PREFIX}/share/pixmaps
	@${INSTALL_DATA} ${WRKSRC}/icons/skype_48_32.png ${PREFIX}/share/pixmaps/skype.png
	@cd ${WRKSRC}/&&${COPYTREE_SHARE} "icons sound lang LICENSE" ${DATADIR}/

.include <bsd.port.post.mk>
