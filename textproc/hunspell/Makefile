PORTNAME=	hunspell
PORTVERSION=	1.7.2
DISTVERSIONPREFIX=	v
CATEGORIES=	textproc
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Improved spell-checker for Hungarian and other languages
WWW=		https://hunspell.github.io/

LICENSE=	gpl2+ lgpl2.1+ MPL11
LICENSE_COMB=	dual

CONFLICTS_INSTALL=	tinker
CONFIGURE_ARGS=	--disable-nls ${ICONV_CONFIGURE_ARG} --with-readline --with-ui
GNU_CONFIGURE=	yes
USES=		autoreconf compiler:c++11-lib cpe gettext-tools libtool:keepla \
		pathfix iconv ncurses readline shebangfix perl5
CPE_VENDOR=	${PORTNAME}_project
USE_GITHUB=	yes
SHEBANG_FILES=	src/tools/ispellaff2myspell
USE_LDCONFIG=	yes
USE_PERL5=	run
INSTALL_TARGET=	install-strip

PLIST_SUB=	SHLIB_VER=${PORTVERSION:R}

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/src/tools/hunspell.cxx

makepatch-clean:
	@${RM} ${WRKSRC}/tests/suggestiontest/Makefile.orig

.include <bsd.port.mk>

# XXX Don't override definition in Mk/bsd.port.mk
makepatch:	makepatch-clean
