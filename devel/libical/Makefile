# $MidnightBSD$

PORTNAME=	libical
PORTVERSION=	3.0.3
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libical/libical/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the IETF's Calendaring and Scheduling protocols 

LICENSE_COMB=	dual
LICENSE=	mpl lgpl2.1

LIB_DEPENDS=	libicuuc.so:devel/icu

CFLAGS_amd64=	-fPIC

USES=		cmake compiler:c++11-lib gnome pathfix perl5 pkgconfig
USE_PERL5=	build
USE_LDCONFIG=	yes

MAKE_JOBS_UNSAFE= yes

BUILD_DEPENDS=	valac:lang/vala \
		gtkdoc-scan:textproc/gtk-doc
USE_GNOME=	introspection:build glib20 libxml2
CMAKE_ARGS+=	-DGOBJECT_INTROSPECTION=true \
		-DICAL_GLIB_VAPI=true \
		-DICAL_BUILD_DOCS=false

.include <bsd.port.mk>
