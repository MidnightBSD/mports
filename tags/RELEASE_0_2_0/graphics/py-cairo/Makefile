# New ports collection makefile for:	py-cairo
# Date created:		2004-12-05
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/py-cairo/Makefile,v 1.1 2007/04/08 04:52:10 laffer1 Exp $
# $FreeBSD: ports/graphics/py-cairo/Makefile,v 1.16 2007/03/19 05:13:34 marcus Exp $
#	$MCom: ports/graphics/py-cairo/Makefile,v 1.22 2007/03/14 21:38:08 ahze Exp $
#

PORTNAME=	cairo
PORTVERSION=	1.4.12
CATEGORIES=	graphics python
MASTER_SITES=	http://cairographics.org/releases/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Cairo
LICENSE=        lgpl
BUILD_DEPENDS=	${PYNUMERIC}
LIB_DEPENDS=	cairo.2:${PORTSDIR}/graphics/cairo
RUN_DEPENDS=	${PYNUMERIC}

USE_PYTHON=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gnomehack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-pygtk --build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include" \
		LDFLAGS="-L${X11BASE}/lib"

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|; \
		s|SUBDIRS = cairo examples test|SUBDIRS = cairo examples|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
