PORTNAME=	Glib-Object-Introspection
PORTVERSION=	0.051
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamically create Perl language bindings

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

# t/vfunc-ref-counting.t requires gobject-introspection 1.35.5+
BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.300:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1:devel/p5-ExtUtils-PkgConfig \
		${RUN_DEPENDS}
LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	p5-Glib>=1.320:devel/p5-Glib
TEST_DEPENDS=	p5-Cairo-GObject>=0:devel/p5-Cairo-GObject

USES=		gnome perl5
USE_GNOME=	introspection
USE_PERL5=	configure

OPTIONS_DEFINE=	TEST

# Glib::Object::Introspection requires cairo and glib20 to build
# test libraries during build phase, therefore we add them to BUILD_DEPENDS.
TEST_BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/cairo.pc:graphics/cairo \
			${LOCALBASE}/libdata/pkgconfig/glib-2.0.pc:devel/glib20

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Glib/Object/Introspection/Introspection.so

.include <bsd.port.mk>
