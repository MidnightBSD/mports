PORTNAME=	aide
PORTVERSION=	0.18.2
CATEGORIES=	security
MASTER_SITES=	https://github.com/aide/aide/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and directory integrity checker
WWW=		https://aide.github.io/

LICENSE=	gpl2

LIB_DEPENDS=	libmhash.so:security/mhash \
		libgcrypt.so:security/libgcrypt \
		libpcre2-8.so:devel/pcre2

USES=		bison gmake localbase pkgconfig

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-mhash=/usr/local/lib \
		--with-zlib \
		--mandir=${PREFIX}/share/man \
		--with-config_file=${PREFIX}/etc/aide.conf
CONFIGURE_ENV=	YACC="bison -y"

LDFLAGS+=	-lpthread

SUB_FILES=	pkg-message

post-install:
	${INSTALL_DATA} ${FILESDIR}/aide.conf.freebsd ${STAGEDIR}${PREFIX}/etc/aide.conf.sample
	${MKDIR} ${STAGEDIR}/var/db/aide/databases
	${CHMOD} 0700 ${STAGEDIR}/var/db/aide ${STAGEDIR}/var/db/aide/databases

.include <bsd.port.mk>
