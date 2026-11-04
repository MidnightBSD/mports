PORTNAME=	less
PORTVERSION=	685
CATEGORIES=	sysutils
MASTER_SITES=	https://www.greenwoodsoftware.com/less/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better pager utility
WWW=		https://www.greenwoodsoftware.com/less/ \
		https://github.com/gwsw/less

LICENSE=	gpl3 mit
LICENSE_COMB=	dual
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING
LICENSE_FILE_mit=	${WRKSRC}/LICENSE

USES=		cpe gmake ncurses

GNU_CONFIGURE=	yes
LIBS+=		-lncurses

PLIST_FILES=	bin/less \
		bin/lessecho \
		bin/lesskey \
		share/man/man1/less.1.gz \
		share/man/man1/lessecho.1.gz \
		share/man/man1/lesskey.1.gz

CPE_VENDOR=	gnu

OPTIONS_DEFINE=	PCRE
OPTIONS_DEFAULT=PCRE

PCRE_CONFIGURE_OFF=	--with-regex=posix
PCRE_CONFIGURE_ON=	--with-regex=pcre2
PCRE_LIB_DEPENDS=	libpcre2-8.so:devel/pcre2
PCRE_USES=		localbase:ldflags

.include <bsd.port.mk>
