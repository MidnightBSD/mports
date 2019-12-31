PORTNAME=	orc
PORTVERSION=	0.4.28
CATEGORIES=	devel
MASTER_SITES= 	http://gstreamer.freedesktop.org/data/src/orc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and toolset to operate arrays of data

LICENSE=	bsd2 bsd3
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake libtool pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=--disable-gtk-doc \
		--host=${ARCH}-portbld-freebsd10.4 \
		--build=${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip

SUBDIRS=	orc orc-test tools

EXAMPLES_DATA=	example1orc.orc example2orc.orc example3orc.orc \
		mt19937arorc.orc

OPTIONS_DEFINE=	DOCS EXAMPLES
DOCS_DESC=	Include gtk-doc documentation

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
SUBDIRS+=	doc
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
SUBDIRS+=	examples
.endif

MAKE_ARGS+=	SUBDIRS="${SUBDIRS}"

post-patch:
	@${REINPLACE_CMD} \
		-E -e '/LIBS/s/-lrt(\ )*//; /LIBRT/s/-lrt//' \
		-e 's|pkgconfigdir=.*|pkgconfigdir=\"\\$$(prefix)/libdata/pkgconfig\"|g' \
		${WRKSRC}/configure 

post-install:
.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${EXAMPLESDIR}
.for FILE in ${EXAMPLES_DATA}
	@${INSTALL_DATA} ${WRKSRC}/examples/${FILE} ${EXAMPLESDIR}/${FILE}
.endfor
.for FILE in ${EXAMPLES_EXEC}
	@${INSTALL_SCRIPT} ${WRKSRC}/examples/${FILE} ${EXAMPLESDIR}/${FILE}
.endfor
.endif

.include <bsd.port.mk>
