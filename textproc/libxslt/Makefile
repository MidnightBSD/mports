PORTNAME=	libxslt
DISTVERSION=	1.1.43
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${DISTVERSION:R}/
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML stylesheet transformation library
WWW=		https://gitlab.gnome.org/GNOME/libxslt/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/Copyright

# See note in textproc/libxml2 for why this port uses autotools
# from the choices of that and CMake.
USES=		cpe gmake gnome libtool localbase:ldflags pathfix pkgconfig tar:xz
CPE_VENDOR=	xmlsoft
GNU_CONFIGURE=	yes
USE_GNOME=	libxml2
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--without-python
INSTALL_TARGET=	install-strip
#TEST_TARGET=	check
NO_TEST=	yes

PLIST_SUB=	LIBVERSION=${PORTVERSION}

OPTIONS_DEFINE=	CRYPTO MEM_DEBUG STATIC
OPTIONS_DEFAULT=	CRYPTO STATIC
OPTIONS_SUB=		yes

CRYPTO_DESC=	Enable crypto support
MEM_DEBUG_DESC=	Enable memory debugging

CRYPTO_LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
			libgpg-error.so:security/libgpg-error
CRYPTO_CONFIGURE_WITH=	crypto

MEM_DEBUG_CONFIGURE_WITH=	mem-debug

STATIC_CONFIGURE_ENABLE=	static

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/ s|install-data-local||' \
		${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e 's|[$$](bindir)/xsltproc|../xsltproc/xsltproc|g ; \
		s|[$$](bindir)/xmllint|../xmllint/xmllint|g' \
		${WRKSRC}/doc/Makefile.in

.include <bsd.port.mk>
