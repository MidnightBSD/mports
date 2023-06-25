PORTNAME=	oniguruma
DISTVERSION=	6.9.8
CATEGORIES=	devel textproc
MASTER_SITES=	https://github.com/kkos/${PORTNAME}/releases/download/v${DISTVERSION}/
DISTNAME=	onig-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Regular expressions library compatible with POSIX/GNU/Perl

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=			autoreconf cpe pathfix libtool  # configure provided in the tarball breaks: https://github.com/kkos/oniguruma/issues/73
GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		--disable-static --enable-posix-api=yes
PATHFIX_MAKEFILEIN=	Makefile.am
USE_LDCONFIG=		yes
INSTALL_TARGET=		install-strip
TEST_WRKSRC=		${WRKSRC}/test
TEST_TARGET=		test
CPE_VENDOR=		oniguruma_project

OPTIONS_DEFINE=			STATISTICS DOCS EXAMPLES
STATISTICS_DESC=		Take matching time statistical data (debug feature)

STATISTICS_CONFIGURE_WITH=	statistics

PORTDOCS=	*
PORTEXAMPLES=	*

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} HISTORY README ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${INSTALL_DATA} * ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/sample && ${INSTALL_DATA} *.c ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
