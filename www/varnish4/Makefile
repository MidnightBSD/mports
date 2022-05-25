PORTNAME=	varnish
PORTVERSION=	4.1.11
DISTVERSIONPREFIX=	varnish-
PORTREVISION=	1
CATEGORIES=	www
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance HTTP accelerator

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	rst2man:textproc/py-docutils
LIB_DEPENDS=	libpcre.so:devel/pcre

CONFLICTS=	varnish6 varnish7

USES=		autoreconf cpe gmake libedit libtool ncurses pathfix \
		pkgconfig python:build readline shebangfix
SHEBANG_FILES=	lib/libvcc/vmodtool.py
CPE_VENDOR=	varnish-cache
CFLAGS+=	-I${LOCALBASE}/include -Wno-error
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX} --enable-tests
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
# magus
NO_TEST=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	varnishcache
GH_PROJECT=	varnish-cache

USERS=		varnish varnishlog
GROUPS=		varnish

USE_RC_SUBR=	varnishd varnishlog varnishncsa
SUB_FILES=	pkg-message
.if defined(NO_INET6) || defined(WITHOUT_INET6)
BAD_TESTS+=	r00832
EXTRA_PATCHES+=	${FILESDIR}/no-inet6.patch
.endif

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|\$$(libdir)/pkgconfig|\$$(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.am
.if defined(BAD_TESTS)
	${RM} -f ${BAD_TESTS:C|.+|${WRKSRC}/bin/varnishtest/tests/\0.vtc|}
.endif

.include <bsd.port.mk>
