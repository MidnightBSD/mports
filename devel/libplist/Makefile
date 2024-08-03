PORTNAME=	libplist
PORTVERSION=	2.6.0
PORTREVISION?=	0
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libimobiledevice/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library to handle Apple Property List format
WWW=		https://www.libimobiledevice.org

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

USES+=		autoreconf compiler cpe libtool pathfix pkgconfig tar:bzip2
CPE_VENDOR=	libimobiledevice

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

SLAVE_PORT?=	no

.if ${SLAVE_PORT} == no

USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--without-cython

TEST_TARGET=	check

PORTDOCS=	AUTHORS NEWS README.md

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.endif # ${SLAVE_PORT} == no

.include <bsd.port.pre.mk>

pre-build:
.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} < 45
	@${REINPLACE_CMD} -e '/__attribute__/ s,deprecated(x),deprecated(),' \
		${WRKSRC}/include/plist/plist.h
.endif

.include <bsd.port.post.mk>
