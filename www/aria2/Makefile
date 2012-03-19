# $MidnightBSD: mports/www/aria2/Makefile,v 1.14 2011/08/31 03:21:27 laffer1 Exp $

PORTNAME=	aria2
PORTVERSION=	1.14.1
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/stable/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another download tool
LICENSE=	gpl2

CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE} --with-openssl \
		--with-libxml2 --without-gnutls --without-libares \
		--without-libcares --program-transform-name="" \
		--with-libz --enable-bittorrent --with-sqlite3 \
		--enable-metalink --disable-epoll --enable-threads=pth

USE_BZIP2=	yes
USE_GNOME=	gnomehack libxml2
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

.ifdef WITHOUT_NLS
CONFIGURE_ARGS+=	--disable-nls
.else
LINGUAS=	ar bg ca da de el en@boldquot en@quot es fi fr he hu id it ko ja \
		nl nn pl pt pt_BR ru sk sr sv th tr uk vi zh_CN zh_TW
.endif

PLIST_FILES=	bin/aria2c \
		${LINGUAS:S|^|share/locale/|:S|$|/LC_MESSAGES/aria2.mo|} \
		share/doc/aria2/bash_completion/README.txt \
		share/doc/aria2/bash_completion/aria2c \
		share/doc/aria2/xmlrpc/aria2mon \
		share/doc/aria2/xmlrpc/aria2rpc \
		share/doc/aria2/xmlrpc/README.txt \
		share/doc/aria2/ru/aria2c.1.html \
		share/doc/aria2/ru/aria2c.1.asciidoc

PLIST_DIRS=	share/doc/aria2/bash_completion \
		share/doc/aria2/xmlrpc \
		share/doc/aria2/ru \
		share/doc/aria2

MANLANG=	"" ru
MAN1=		aria2c.1

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
BROKEN=		Does not compile on MidnightBSD 0.2
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/s|install-dist_docDATA||'\
		${WRKSRC}/Makefile.in ${WRKSRC}/doc/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e '/SETMODE/d' ${WRKSRC}/config.h

.include <bsd.port.post.mk>
