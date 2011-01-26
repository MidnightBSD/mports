# New ports collection makefile for:	Enemy Territory TrueCombat:Elite
# Date created:			25 Mar 2005
# Whom:				Jean-Yves Lefort <jylefort@FreeBSD.org>
#
# $MidnightBSD: mports/games/linux-enemyterritory-tce/Makefile,v 1.2 2008/03/21 22:38:58 laffer1 Exp $
# $FreeBSD: ports/games/linux-enemyterritory-tce/Makefile,v 1.5 2006/05/31 01:43:26 alepulver Exp $
#

PORTNAME=	enemyterritory-tce
PORTVERSION=	0.49
PORTREVISION=	1
CATEGORIES=	games linux
MASTER_SITES=	http://afro.truecombat.jp/files/tce/0.49/
PKGNAMEPREFIX=	linux-
DISTNAME=	tcetest
DISTFILES=	tcetest049.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A modern tactical Enemy Territory modification
LICENSE=	restricted

BUILD_DEPENDS=	et:${PORTSDIR}/games/linux-enemyterritory
RUN_DEPENDS=	${BUILD_DEPENDS)

ONLY_FOR_ARCHS=	i386 amd64
USE_ZIP=	yes
USE_LINUX=	yes
RESTRICTED=	Redistribution is limited, see license
ETDIR=		${PREFIX}/lib/enemyterritory

PORTDOCS=	*

DESKTOP_ENTRIES="Enemy Territory TrueCombat:Elite" \
		"Play Enemy Territory TrueCombat:Elite" \
		"${ETDIR}/tcetest/tce_icon_pc.ico" \
		"et-tce" \
		"" \
		false

do-build:
.for f in et etded
	@${ECHO_CMD} '#!/bin/sh' > ${WRKSRC}/${f}-tce
	@${ECHO_CMD} 'exec ${PREFIX}/bin/${f} +set fs_game tcetest "$$@"' >> ${WRKSRC}/${f}-tce
.endfor

do-install:
.for f in et etded
	${INSTALL_SCRIPT} ${WRKSRC}/${f}-tce ${PREFIX}/bin
.endfor

	${MKDIR} ${ETDIR}/tcetest
.for f in autoexec.cfg cgame.mp.i386.so mp_bin.pk3 official.dat pak0.pk3 \
	pak1.pk3 pak2.pk3 pak3.pk3 qagame.mp.i386.so tce_icon_pc.ico \
	ui.mp.i386.so
	${INSTALL_DATA} ${WRKSRC}/${f} ${ETDIR}/tcetest
.endfor
.for f in cgame.mp.i386.so qagame.mp.i386.so ui.mp.i386.so
	-${CHOWN} ${LIBOWN}:${LIBGRP} ${ETDIR}/tcetest/${f}
	${CHMOD} ${LIBMODE} ${ETDIR}/tcetest/${f}
.endfor

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in *.txt *.rtf	
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
