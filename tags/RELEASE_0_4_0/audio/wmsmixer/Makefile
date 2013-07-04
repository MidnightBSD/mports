# $MidnightBSD: mports/audio/wmsmixer/Makefile,v 1.6 2010/02/27 21:24:15 laffer1 Exp $
# $FreeBSD: ports/audio/wmsmixer/Makefile,v 1.9 2006/05/25 21:57:23 pav Exp $
#

PORTNAME=	wmsmixer
PORTVERSION=	0.5.1
PORTREVISION=	3
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.dockapps.org/files/63/268/ \
		http://redundancy.redundancy.org/mirror/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	An audio mixer for the WindowMaker dock
LICENSE=	gpl2

PLIST_FILES=	bin/wmsmixer
PORTDOCS=	README
USE_XORG=	xpm
USE_IMAKE=	YES
MAKE_ARGS=	CC="${CXX}" CFLAGS="${CXXFLAGS}"

BUILD_DEPENDS+= ${LOCALBASE}/bin/gccmakedep:${PORTSDIR}/devel/gccmakedep \
	${LOCALBASE}/lib/X11/config/Imake.tmpl:${PORTSDIR}/x11/xorg-cf-files

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmsmixer ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
