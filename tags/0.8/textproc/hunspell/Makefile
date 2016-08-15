# $MidnightBSD$
# $FreeBSD: ports/textproc/hunspell/Makefile,v 1.30 2011/11/09 15:25:45 miwi Exp $

PORTNAME=	hunspell
PORTVERSION=	1.3.3
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/Hunspell/${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Improved spell-checker for Hungarian and other languages

LICENSE=	gpl2 lgpl2.1 mpl
LICENSE_COMB=	dual

CONFLICTS_INSTALL=	tinker-[0-9]*
CONFIGURE_ARGS=	--disable-nls ${ICONV_CONFIGURE_ARG} --with-readline --with-ui
GNU_CONFIGURE=	yes
USES=		libtool:keepla pathfix iconv ncurses readline shebangfix perl5
SHEBANG_FILES=	src/tools/ispellaff2myspell
USE_LDCONFIG=	yes
USE_PERL5=	run
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/src/tools/hunspell.cxx

post-configure:
	@${REINPLACE_CMD} -e 's|444|644|g' ${WRKSRC}/src/parsers/Makefile

.include <bsd.port.mk>
