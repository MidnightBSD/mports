PORTNAME=	ddrescue
PORTVERSION=	1.27
CATEGORIES=	sysutils
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data recovery tool
WWW=		https://www.gnu.org/software/ddrescue/ddrescue.html

LICENSE=	gpl2

USES=		tar:lz
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	CC="${CC}" CXX="${CXX}" CFLAGS="${CFLAGS}" \
		CXXFLAGS="${CXXFLAGS}"

#INFO=		ddrescue
PLIST_FILES=	bin/ddrescue \
		bin/ddrescuelog \
		share/man/man1/ddrescue.1.gz \
		share/man/man1/ddrescuelog.1.gz
PORTDOCS=	AUTHORS ChangeLog NEWS README

OPTIONS_DEFINE=	DOCS

do-install:
.for i in ddrescue ddrescuelog
	${INSTALL_PROGRAM} ${WRKSRC}/${i} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/${i}.1 ${STAGEDIR}${PREFIX}/share/man/man1
.endfor
	${INSTALL_DATA} ${WRKSRC}/doc/ddrescue.info ${STAGEDIR}${PREFIX}/${INFO_PATH}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
