# $MidnightBSD: mports/x11-fonts/fontconfig/Makefile,v 1.11 2011/02/02 21:37:25 laffer1 Exp $

PORTNAME=	fontconfig
PORTVERSION=	2.8.0
PORTEPOCH?=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.freedesktop.org/software/fontconfig/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XML-based font configuration API for X Windows
LICENSE=	x11

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		expat.6:${PORTSDIR}/textproc/expat2

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack pkgconfig ltverhack
CONFIGURE_ARGS=	--with-confdir=${PREFIX}/etc/fonts \
		--with-expat-includes=${LOCALBASE}/include \
		--with-expat-lib=${LOCALBASE}/lib \
		--with-default-fonts=${LOCALBASE}/lib/X11/fonts \
		--with-cache-dir=/var/db/fontconfig \
		--without-add-fonts \
		--disable-docs
MAKE_ENV=	LC_ALL=C
SUB_FILES=	pkg-install
PKGINSTALL=	${WRKDIR}/pkg-install

MAKE_JOBS_SAFE=	yes

MAN1=		fc-cache.1 fc-cat.1 fc-list.1 fc-match.1 fc-query.1 fc-scan.1
MAN5=		fonts-conf.5
PORTDOCS=	fontconfig-user.html fontconfig-user.pdf fontconfig-user.txt

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${DOCSDIR}
.endif
	${INSTALL_MAN} ${MAN5:S|^|${WRKSRC}/doc/|} ${PREFIX}/man/man5
.for manpage in ${MAN1}
	${INSTALL_MAN} ${FILESDIR}/${manpage} ${PREFIX}/man/man1
.endfor
	if [ ! -f ${PREFIX}/etc/fonts/fonts.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf; \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	fi

.include <bsd.port.post.mk>

.endif
