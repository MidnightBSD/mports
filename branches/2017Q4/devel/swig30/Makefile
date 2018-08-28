# Created by: jkh
# $MidnightBSD$
# $FreeBSD: head/devel/swig30/Makefile 394080 2015-08-13 17:31:40Z sunpoet $

PORTNAME=	swig
PORTVERSION=	3.0.7
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	30

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate wrappers for calling C/C++ code from other languages

LICENSE=	gpl3

LIB_DEPENDS=	libpcre.so:${PORTSDIR}/devel/pcre

OPTIONS_DEFINE=	DOCS EXAMPLES

ALL_TARGET=	# empty
CFLAGS+=	-fPIC -DPIC
CONFIGURE_ARGS=	--program-suffix=${PORTVERSION:R} \
		--with-lua=${LOCALBASE}/bin/${LUA_CMD} \
		--with-luaincl=${LUA_INCDIR} \
		--with-lualib=${LUA_LIBDIR}
GNU_CONFIGURE=	yes
USES=		gmake lua

PLIST_SUB=	MAJOR_VER=${PORTVERSION:R} \
		DOCSDIR=${DOCSDIR_REL} \
		DATADIR=${DATADIR_REL} \
		EXAMPLESDIR=${EXAMPLESDIR_REL}
PORTDATA=	*
PORTDOCS=	*
PORTEXAMPLES=	*

OCTAVE_VER_CMD=	${LOCALBASE}/bin/octave-config -v 2>/dev/null || ${TRUE}

post-patch:
	@${SETENV} OCTAVE_VER=$$(${OCTAVE_VER_CMD}) ${REINPLACE_CMD} \
		-e 's|$$RUBY |${RUBY} |' \
		-e 's|^PHP4CONFIG=.*$$|PHP4CONFIG=php-config|' \
		-e 's|OCTAVEDIR=".*"|OCTAVEDIR="${LOCALBASE}/include/octave-$${OCTAVE_VER}"|' \
		-e 's|MZSCHEME --mute-banner|MZSCHEME|' \
		-e '/^MZDYNOBJ/s|`$$|\| tail -n 1`|' \
			${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' ${WRKSRC}/Lib/lua/luarun.swg

post-configure:
	${REINPLACE_CMD} -e 's#null#&|| true#' ${WRKSRC}/Makefile

post-install:
	${STRIP_CMD} ${PREFIX}/bin/ccache-swig${PORTVERSION:R} ${PREFIX}/bin/swig${PORTVERSION:R}
	cd ${WRKSRC}/Doc/ && ${COPYTREE_SHARE} . ${DOCSDIR}/${PORTVERSION}
	cd ${WRKSRC}/Examples/ && ${COPYTREE_SHARE} . ${EXAMPLESDIR}/${PORTVERSION}

.include <bsd.port.mk>
