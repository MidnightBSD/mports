PORTNAME=	gawk
PORTVERSION=	3.0.6
PORTREVISION=	2
CATEGORIES=	japanese lang
MASTER_SITES=	GNU

PATCH_SITES=	http://www.hinadori.atnifty.com/~wills/program/
PATCHFILES=	${PORTNAME}mb115.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU awk + multi-byte extension

LICENSE=	gpl2

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--enable-bitops --enable-non-decimal-data
MAKE_JOBS_UNSAFE=	yes

CONFLICTS_INSTALL=	gawk # bin/gawk

DOCSDIR=	${PREFIX}/share/doc/${PKGBASE}

OPTIONS_DEFINE=	DOCS

post-configure:
	@${REINPLACE_CMD} -E \
	'/(DEFPATH|sed )/!s,(bin|data|lib|info|man|libexec)dir\),DESTDIR\)$$\(&,g' \
		${WRKSRC}/Makefile ${WRKSRC}/doc/Makefile ${WRKSRC}/awklib/Makefile

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} OREADME.MB README.MB ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
