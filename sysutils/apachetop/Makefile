PORTNAME=	apachetop
DISTVERSION=	0.19.7
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache realtime log stats
WWW=		https://github.com/tessus/apachetop

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		autoreconf:2.69 cpe ncurses readline
USE_GITHUB=	yes
GH_ACCOUNT=	tessus

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--mandir=${PREFIX}/man
CONFIGURE_ENV+=	NCURSES_CFLAGS="-I${NCURSESINC}" NCURSES_LIBS="-lncursesw"

PLIST_FILES=	bin/${PORTNAME} man/man1/${PORTNAME}.1.gz

OPTIONS_DEFINE=	ADNS FAM PCRE

ADNS_DESC=	Asynchronous-capable DNS support
ADNS_LIB_DEPENDS=	libadns.so:dns/adns
ADNS_CONFIGURE_WITH=	adns=${LOCALBASE}

FAM_LIB_DEPENDS=	libfam.so:devel/fam
FAM_CONFIGURE_WITH=	fam=${LOCALBASE}

PCRE_LIB_DEPENDS=	libpcre.so:devel/pcre
PCRE_CONFIGURE_WITH=	pcre=${LOCALBASE}

.include <bsd.port.mk>
