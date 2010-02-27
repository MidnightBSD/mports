# $MidnightBSD: mports/audio/wmsmixer/Makefile,v 1.5 2008/04/10 05:08:21 ctriv Exp $
# $FreeBSD: ports/audio/wmsmixer/Makefile,v 1.9 2006/05/25 21:57:23 pav Exp $
#

PORTNAME=	wmsmixer
PORTVERSION=	0.5.1
PORTREVISION=	3
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.hibernaculum.net/download/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	An audio mixer for the WindowMaker dock
LICENSE=	gpl2

PLIST_FILES=	bin/wmsmixer
USE_XORG=	xpm
USE_IMAKE=	YES
MAKE_ARGS=	CC="${CXX}" CFLAGS="${CXXFLAGS}"

BUILD_DEPENDS+= ${LOCALBASE}/bin/gccmakedep:${PORTSDIR}/devel/gccmakedep \
	${LOCALBASE}/lib/X11/config/Imake.tmpl:${PORTSDIR}/x11/xorg-cf-files

.include <bsd.port.mk>
