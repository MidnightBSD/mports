PORTNAME=	source-highlight
DISTVERSION=	3.1.9
CATEGORIES=	textproc
MASTER_SITES=	GNU/src-highlite

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C/C++ and Java sources to HTML converter
WWW=		https://www.gnu.org/software/src-highlite/source-highlight.html

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	exctags:devel/ctags
LIB_DEPENDS=	libboost_regex.so:devel/boost-libs

USES=		compiler:c++11-lang gmake pathfix libtool localbase
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-bash-completion
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	java2html # bin/java2html

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	*
PORTEXAMPLES=	*
INFO=		source-highlight-lib source-highlight

NO_TEST=	yes

.include <bsd.port.mk>
