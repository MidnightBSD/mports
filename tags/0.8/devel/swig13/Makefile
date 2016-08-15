# $MidnightBSD$

PORTNAME=	swig
PORTVERSION=	1.3.40
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simplified Wrapper and Interface Generator

LICENSE=	bsd2

USE_AUTOTOOLS=	autoconf:env
GNU_CONFIGURE=	yes

VER=		${PORTVERSION:R}
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

# Supported languages: guile perl php4 python ruby tcl ocaml pike java csharp
#                      allegrocl modula3 chicken

WRKSRC=		${WRKDIR}/${DISTNAME}
CFLAGS+=	-fPIC -DPIC
ALL_TARGET=	swig
PLIST_SUB+=	VER="${VER}"

PORTDOCS=	*
PORTEXAMPLES=	*
PORTDATA=	*

OPTIONS_DEFINE=	LUA DOCS EXAMPLES
OPTIONS_DEFAULT=DOCS EXAMPLES
LUA_DESC=	Enable Lua support

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MLUA}
USES+=		lua:51
CONFIGURE_ARGS+=--with-lua=${LUA_BINDIR}/lua \
		--with-luaincl=${LUA_INCDIR} \
		--with-lualib=${LUA_LIBDIR}
.else
CONFIGURE_ARGS+=--without-lua
.endif

OCTAVE_VER_CMD=	${LOCALBASE}/bin/octave-config -v 2>/dev/null || ${TRUE}

post-patch:
	${SETENV} OCTAVE_VER=$$(${OCTAVE_VER_CMD}) \
	${REINPLACE_CMD} -e 's|$$RUBY |${RUBY} |; \
		s|^PHP4CONFIG=.*$$|PHP4CONFIG=php-config|; \
		s|OCTAVEDIR=".*"|OCTAVEDIR="${LOCALBASE}/include/octave-$${OCTAVE_VER}"|; \
		s|MZSCHEME --mute-banner|MZSCHEME|; \
		/^MZDYNOBJ/s|`$$|\| tail -n 1`|; \
		' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' \
		${WRKSRC}/Lib/lua/luarun.swg

post-configure:
	${REINPLACE_CMD} -e 's#null#&|| true#' ${WRKSRC}/Makefile

post-install:
	${LN} -f ${PREFIX}/bin/${PORTNAME} ${PREFIX}/bin/${PORTNAME}${VER}
	cd ${WRKSRC}/Examples && ${COPYTREE_SHARE} '*' ${EXAMPLESDIR}/${PORTVERSION}
	cd ${WRKSRC}/Doc && ${COPYTREE_SHARE} '*' ${DOCSDIR}/${PORTVERSION}
	${STRIP_CMD} ${PREFIX}/bin/*

.include <bsd.port.post.mk>
