PORTNAME=	libtextstyle
PORTREVISION=	0

COMMENT=	Text styling library
WW=		https://www.gnu.org/software/gettext/libtextstyle/manual/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

.include "${.CURDIR}/../gettext/Makefile.common"

USES=		iconv libtool ncurses tar:xz
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libncurses-prefix=${NCURSESBASE}
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
WRKSRC_SUBDIR=	libtextstyle

INFO=		libtextstyle

OPTIONS_DEFINE=	DOCS

DOCSDIR=	${LOCALBASE}/share/doc/libtextstyle

.include <bsd.port.mk>
