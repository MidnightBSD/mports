# $MidnightBSD: mports/graphics/py-cairo/Makefile,v 1.4 2010/01/23 19:27:06 laffer1 Exp $

PORTNAME=	cairo
PORTVERSION=	1.8.8
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

USE_PYTHON=	2.6+
USE_GMAKE=	yes
USE_GNOME=	 gnomehack
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
