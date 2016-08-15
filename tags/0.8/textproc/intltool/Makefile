# $MidnightBSD$

PORTNAME=	intltool
PORTVERSION=	0.51.0
CATEGORIES=	textproc gnome
MASTER_SITES=	https://launchpad.net/intltool/trunk/$(PORTVERSION)/+download/
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to internationalize various kinds of data files

LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser
RUN_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser

USES=		gmake iconv
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--libdir="${PREFIX}/libdata"

CONFLICTS=	xml-i18n-tools-[0-9]*

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} \
		-E -e '/^mkinstalldirs[[:space:]]*=/s^/\.\.^^g'

post-install:
	@${MKDIR} ${PREFIX}/share/intltool/XML/Parser/Style
	@${INSTALL_DATA} ${FILESDIR}/OrigTree.pm \
		${PREFIX}/share/intltool/XML/Parser/Style

.include <bsd.port.mk>
