PORTNAME=	sed
PORTVERSION=	4.9
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	GNU
PKGNAMEPREFIX=	g

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU stream editor
WWW=		https://www.gnu.org/software/sed/sed.html

LICENSE=	gpl3+ gfdl
LICENSE_COMB=	multi
LICENSE_FILE_gpl3+ =	${WRKSRC}/COPYING

USES=		charsetfix cpe makeinfo tar:xz
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	--program-prefix=g
CONFIGURE_ENV+=	MAKEINFO="${MAKEINFO} --no-split"
TEST_TARGET=	check
CPE_VENDOR=	gnu

DATADIR=	${PREFIX}/share/${PKGBASE}
DOCSDIR=	${PREFIX}/share/doc/${PKGBASE}
EXAMPLESDIR=	${PREFIX}/share/examples/${PKGBASE}
INFO=		sed
PORTDOCS=	AUTHORS BUGS ChangeLog ChangeLog-2014 NEWS README THANKS
PORTEXAMPLES=	binary*.sed dc.sed

OPTIONS_DEFINE=	NLS DOCS EXAMPLES
OPTIONS_SUB=	yes

NLS_USES=	gettext iconv
NLS_CONFIGURE_ENABLE=	nls

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} 's,^\* sed:,* GNU sed:,' \
		${WRKSRC}/doc/config.texi

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S,^,${WRKSRC}/testsuite/,} \
		${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
