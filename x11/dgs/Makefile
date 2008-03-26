# New ports collection makefile for:   dgs
# Date created:        22 April 1998
# Whom:                Yukihiro Nakai <Nakai@technologist.com>
#
# $MidnightBSD: mports/x11/dgs/Makefile,v 1.5 2007/05/04 06:51:54 ctriv Exp $
# $FreeBSD: ports/x11/dgs/Makefile,v 1.44 2006/07/26 15:30:48 dinoex Exp $
#

PORTNAME=	dgs
PORTVERSION=	0.5.9.1
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	dgs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A display ghostscript system
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff

USE_GHOSTSCRIPT_RUN=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	glib12
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-0.5.9

MAN1=		dgs.1 dpsnx.agent.1
MANN=		dpsexec.man xepsf.man
INSTALLDIRS=	gs DPS/demos/dpsexec DPS/demos/xepsf DPS/lib/dpstk DPS/lib/psres \
		DPS/clients/makepsres DPS/demos/texteroids

.include <bsd.port.pre.mk>

pre-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} \
		${REINPLACE_CMD} -e 's|manm|mann|g'


do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/dgs-config ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/dpsnx.agent ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/path_dps.m4 ${PREFIX}/share/aclocal/
	${INSTALL_MAN} ${WRKSRC}/dpsnx.agent.1 ${PREFIX}/man/man1/
.for i in ${INSTALLDIRS}
	@(cd ${INSTALL_WRKSRC}/${i} && ${SETENV} ${MAKE_ENV} \
		${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
.endfor


.include <bsd.port.post.mk>
