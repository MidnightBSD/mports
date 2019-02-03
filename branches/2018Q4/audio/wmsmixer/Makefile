# $MidnightBSD$
# $FreeBSD: ports/audio/wmsmixer/Makefile,v 1.9 2006/05/25 21:57:23 pav Exp $

PORTNAME=	wmsmixer
PORTVERSION=	0.5.1
PORTREVISION=	4
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://redundancy.redundancy.org/mirror/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Audio mixer for the WindowMaker dock

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

PLIST_FILES=	bin/wmsmixer
PORTDOCS=	README

USES=		imake
USE_XORG=	xpm
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
