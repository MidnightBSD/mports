# $MidnightBSD: mports/devel/libbonobo/Makefile,v 1.9 2011/05/30 14:56:01 laffer1 Exp $

PORTNAME=	libbonobo
PORTVERSION=	2.32.0
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A component and compound document system for GNOME2
LICENSE=	gpl2

USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_GMAKE=	yes
USE_BISON=	build
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_PERL5=	yes
USE_GNOME=	intlhack libxml2 orbit2 referencehack
USE_PKGCONFIG=	build
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -pthread
MAKE_ENV=	gnomelocaledir=${PREFIX}/share/locale

MAN1=		bonobo-activation-server.1

.include <bsd.port.mk>

.endif
