PORTNAME=	gdbm
PORTVERSION=	1.26
CATEGORIES=	databases
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU database manager
WWW=		https://www.gnu.org.ua/software/gdbm/

LICENSE=	gpl3

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
USES=		gmake libtool:keepla ncurses readline
USE_LDCONFIG=	yes

MAKE_JOBS_UNSAFE=	yes

INFO=		gdbm

OPTIONS_DEFINE=	COMPAT NLS
OPTIONS_SUB=	yes
COMPAT_DESC=	Enable dbm/ndbm compatibility

COMPAT_CONFIGURE_ENABLE=	libgdbm-compat
NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
