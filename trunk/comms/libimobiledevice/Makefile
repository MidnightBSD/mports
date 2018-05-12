# $MidnightBSD$

PORTNAME=	libimobiledevice
PORTVERSION=	1.1.6
PORTREVISION?=	1
CATEGORIES?=	comms
MASTER_SITES=	http://www.${PORTNAME}.org/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library to communicate with Apple iOS devices

LICENSE?=	lgpl2.1

SLAVE_PORT?=	no

USES+=		libtool pathfix pkgconfig ssl tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=openssl_CFLAGS="-I${OPENSSLINC}" \
		openssl_LIBS="-L${OPENSSLLIB} -lssl -lcrypto"
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.if ${SLAVE_PORT} == no

LIB_DEPENDS=	libplist.so:${PORTSDIR}/devel/libplist \
		libusbmuxd.so:${PORTSDIR}/comms/libusbmuxd

USE_GNOME=	glib20
CONFIGURE_ARGS+=--without-cython
USE_CSTD=	gnu89
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS NEWS README

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's, *@ssl_requires@,,' \
		${WRKSRC}/${PORTNAME}*.pc.in
	@${REINPLACE_CMD} -e 's,$$(libdir)/pkgconfig,${PREFIX}/libdata/pkgconfig,g' \
		${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.endif # ${SLAVE_PORT} == no

.include <bsd.port.mk>
