# Created by: jkh

PORTNAME=	swig
PORTVERSION=	3.0.12
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	30

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate wrappers for calling C/C++ code from other languages

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE-GPL

LIB_DEPENDS=	libpcre.so:devel/pcre

OPTIONS_DEFINE=	DOCS EXAMPLES

ALL_TARGET=	# empty
CFLAGS+=	-fPIC -DPIC
CONFIGURE_ARGS=	--program-suffix=${PORTVERSION:R} \
		--with-lua=${LOCALBASE}/bin/${LUA_CMD} \
		--with-luaincl=${LUA_INCDIR} \
		--with-lualib=${LUA_LIBDIR}
GNU_CONFIGURE=	yes
#TEST_TARGET=	check
NO_TEST=	yes
USES=		gmake lua:build

PLIST_SUB=	PORTVERSION=${PORTVERSION}

OCTAVE_VER_CMD=	${LOCALBASE}/bin/octave-config -v 2>/dev/null || ${TRUE}

post-patch:
	@${SETENV} OCTAVE_VER=$$(${OCTAVE_VER_CMD}) ${REINPLACE_CMD} \
		-e 's|$$RUBY |${RUBY} |' \
		-e 's|^PHP4CONFIG=.*$$|PHP4CONFIG=php-config|' \
		-e 's|OCTAVEDIR=".*"|OCTAVEDIR="${LOCALBASE}/include/octave-$${OCTAVE_VER}"|' \
		-e 's|MZSCHEME --mute-banner|MZSCHEME|' \
		-e '/^MZDYNOBJ/s|`$$|\| tail -n 1`|' \
			${WRKSRC}/configure

post-configure:
	@${REINPLACE_CMD} -e 's#null#&|| true#' ${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/ccache-swig${PORTVERSION:R} ${STAGEDIR}${PREFIX}/bin/swig${PORTVERSION:R}

post-install-DOCS-on:
	@cd ${WRKSRC}/Doc/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/${PORTVERSION}

post-install-EXAMPLES-on:
	@cd ${WRKSRC}/Examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}/${PORTVERSION}

.include <bsd.port.mk>
